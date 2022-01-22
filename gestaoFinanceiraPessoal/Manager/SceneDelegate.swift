//
//  SceneDelegate.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 20/01/22.
//

import Foundation
import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let app = UIApplication.shared
        let delegate = app.delegate as! AppDelegate
        let contentView = ContentView()
            .environmentObject(delegate.myData)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
