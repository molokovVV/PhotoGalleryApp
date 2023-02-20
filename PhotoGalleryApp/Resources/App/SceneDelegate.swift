//
//  SceneDelegate.swift
//  PhotoGalleryApp
//
//  Created by Виталик Молоков on 31.01.2023.
//

import UIKit
import SnapKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = TabBarController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

