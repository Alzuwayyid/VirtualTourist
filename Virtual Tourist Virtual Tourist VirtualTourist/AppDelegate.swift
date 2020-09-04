//
//  AppDelegate.swift
//  Virtual Tourist Virtual Tourist VirtualTourist
//
//  Created by MUHAMMED ZOYED on 22/08/2020.
//  Copyright © 2020 Alzuwayyid. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let dataController = DataController(modelName: "Virtual Tourist Virtual Tourist VirtualTourist")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

      //  dataController.load()
        
        return true
    }
    
     /*   func applicationDidEnterBackground(_ application: UIApplication) {

            saveViewContext()
        }

        func applicationWillTerminate(_ application: UIApplication) {
            // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
            saveViewContext()
        }

        func saveViewContext() {
            try? dataController.viewContext.save()
        }*/
    }


