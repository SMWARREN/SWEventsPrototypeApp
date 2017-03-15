//
//  AppDelegate.swift
//
//  Created by Sean Warren on 2/12/17.
//  Copyright © 2017 Sean Warren. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var currentNavController:  UINavigationController?
    var downloadData =  [(title: String, imageName: String)]()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window?.makeKeyAndVisible()

        let navigationBarAppearace = UINavigationBar.appearance()

        navigationBarAppearace.tintColor = UIColor.red
        navigationBarAppearace.barTintColor = UIColor.white

        let testData = SWTabBar.init()
        let menuItems = testData.createDemoData()

        window?.rootViewController  = SWTabBarController(incomingArray: menuItems)

        return true
    }
    func generateFonts(size: CGFloat) -> [UIFont] {
        return UIFont.familyNames.flatMap {
            UIFont.fontNames(forFamilyName: $0).flatMap {
                UIFont(name: $0, size: size)
            }
        }
    }

}
