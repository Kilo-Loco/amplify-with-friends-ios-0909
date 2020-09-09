//
//  SceneDelegate.swift
//  uploadin some stuff
//
//  Created by Kyle Lee on 9/9/20.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        let contentView = ContentView()

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            let tabBarController = UITabBarController()
            tabBarController.viewControllers = []
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    

}

