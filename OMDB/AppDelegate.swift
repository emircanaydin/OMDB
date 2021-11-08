//
//  AppDelegate.swift
//  OMDB
//
//  Created by Emircan Aydın on 3.11.2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        self.window = UIWindow()
        let splashView = SplashViewBuilder.build {
            self.initializeMainView()
        }
    
        window?.rootViewController = splashView
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func initializeMainView() {
        DispatchQueue.main.async {
            UIView.transition(with: self.window!, duration: 0.3, options: .transitionCrossDissolve) {
                self.fireMainView()
            }
        }
    }
    
    private func fireMainView() {
        let mainViewController = MainWireframe().viewController
        let navigationController = UINavigationController(rootViewController: mainViewController)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

