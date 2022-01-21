//
//  AppDelegate.swift
//  gestaoFinanceiraPessoal
//
//  Created by Raphael Alkamim on 20/01/22.
//
import UIKit

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var myData: AppData!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions lauchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        myData = AppData()
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connecttingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connecttingSceneSession.role)
    }
}
