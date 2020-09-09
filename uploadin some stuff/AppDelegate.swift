//
//  AppDelegate.swift
//  uploadin some stuff
//
//  Created by Kyle Lee on 9/9/20.
//

import Amplify
import AmplifyPlugins
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureAmplify()
        return true
    }
    
    func configureAmplify() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.add(plugin: AWSS3StoragePlugin())
            
            try Amplify.configure()
            print("Success")
            
        } catch {
            print("failed")
        }
    }

}

