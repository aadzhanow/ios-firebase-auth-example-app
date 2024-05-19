//
//  SceneDelegate.swift
//  ios-firebase-auth-example-app
//
//  Created by Alisher on 16.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    static var shared: SceneDelegate?

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        Self.shared = self
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let vc = WelcomeViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func changeRootViewController(to viewController: UIViewController, animated: Bool = true) {
        guard let window = self.window else { return }

        if animated {
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
                let oldState = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                window.rootViewController = viewController
                UIView.setAnimationsEnabled(oldState)
            }, completion: nil)
        } else {
            window.rootViewController = viewController
        }
    }
}
