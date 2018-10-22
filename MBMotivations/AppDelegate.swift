//
//  ViewController.swift
//  MB Motivation App
//
//  Created by: Thomas Brun on 08/18/18.
//  Owner: Mergim Berisha
//  Copyright © 2018 MB Motivations, Inc. All rights reserved.
//

//Import all needed Swift Libraries
import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
	var window: UIWindow?
    
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		if #available(iOS 10.0, *) {
            //Grant permissions to fire notifications
			let center = UNUserNotificationCenter.current() 
			center.delegate = self                   
			center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
			}
        }
        @available(iOS 10.0, *)
        //Grant permissions to fire notifications
        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {                     completionHandler(.alert)
        }
        
        UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
		return true
	}
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if let vc = window?.rootViewController as? ViewController {
            vc.updateUI()
            
        }
    }
    
}
