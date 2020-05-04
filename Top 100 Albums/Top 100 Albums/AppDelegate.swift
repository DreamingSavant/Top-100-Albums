//
//  AppDelegate.swift
//  Top 100 Albums
//
//  Created by Roderick Presswoodd on 4/26/20.
//  Copyright © 2020 Roderick Presswoodd. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    static var shared: AppDelegate?
    
    override init() {
        super.init()
        AppDelegate.shared = self
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = TopAlbumsTableViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

