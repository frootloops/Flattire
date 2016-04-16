//
//  AppDelegate.swift
//  Flattire
//
//  Created by Arsen Gasparyan on 14/02/16.
//  Copyright © 2016 Arsen Gasparyan. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        changeStoryboardIfNeeded()
        return true
    }

    // MARK: Helpers
    
    private func changeStoryboardIfNeeded() {
//        guard !Defaults[.hasLaunchedOnce] else { return }
//        Defaults[.hasLaunchedOnce] = true
        
        let welcome = UIStoryboard(name: "Welcome", bundle: .mainBundle())
        window?.rootViewController = welcome.instantiateInitialViewController()
    }
}
