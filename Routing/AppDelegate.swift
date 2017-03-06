//
//  AppDelegate.swift
//  Routing
//
//  Created by Matt Fenwick on 3/4/17.
//  Copyright © 2017 mf. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private var presentable: WonkyApplication? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let app = WonkyApplication()
        // TODO not sure why I can't present, instead of replacing the root VC,
        // but iOS says the root VC is not in the view hierarchy
        window?.rootViewController = app.viewController
        presentable = app
        
        return true
    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        print("opening route: \(url) \(application) \(sourceApplication) \(annotation)")

        let vc = LoginViewController()
        let nav = UINavigationController(rootViewController: vc)
        window?.rootViewController?.present(nav, animated: true, completion: nil)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}
