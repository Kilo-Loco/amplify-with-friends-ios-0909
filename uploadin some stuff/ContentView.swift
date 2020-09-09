//
//  ContentView.swift
//  uploadin some stuff
//
//  Created by Kyle Lee on 9/9/20.
//

import Amplify
import Combine
import SwiftUI

struct ContentView: View {
    
    @State var shouldShowPhotoPicker = false
    
    var body: some View {
        Button("Gallery") {
            shouldShowPhotoPicker = true
        }
        .sheet(isPresented: $shouldShowPhotoPicker, content: {
            PhotoPicker(isPresented: $shouldShowPhotoPicker) { image in
                print(image)
            }
        })
    }
    
    @State var token: AnyCancellable?
    func uploadImage() {
        let image = UIImage()
        let data = image.jpegData(compressionQuality: 0.5)!
        let key = UUID().uuidString + ".jpg"
        
        
        token = Amplify.Storage.uploadData(key: key, data: data)
            .resultPublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("finsihed")
                case .failure(let error):
                    print("Error", error)
                }
            } receiveValue: { (key) in
                print("Do something with the key", key)
            }

    }
    
    @State var downloadToken: AnyCancellable?
    func downloadImage() {
        let key = UUID().uuidString
        
        downloadToken = Amplify.Storage.downloadData(key: key)
            .resultPublisher
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("Stream completed")
                    case .failure(let error):
                        print("Error", error)
                    }
                },
                receiveValue: { imageData in
                    print("do something with image data", imageData)
                }
            )

    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
