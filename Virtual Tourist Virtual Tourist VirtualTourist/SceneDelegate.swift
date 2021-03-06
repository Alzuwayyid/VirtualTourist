//
//  SceneDelegate.swift
//  Virtual Tourist Virtual Tourist VirtualTourist
//
//  Created by MUHAMMED ZOYED on 22/08/2020.
//  Copyright © 2020 Alzuwayyid. All rights reserved.
//

import UIKit
import CoreData
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let dataController = DataController(modelName: "Virtual Tourist Virtual Tourist VirtualTourist")

//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        let navigationController = window?.rootViewController as! UINavigationController
//        let mapview = navigationController.topViewController as! MapViewController
//        mapview.dataController = dataController
//
//        dataController.load()
//
//
//        return true
//    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        let navigationController = window?.rootViewController as! UINavigationController
         let mapview = navigationController.topViewController as! MapViewController
         mapview.dataController = dataController
           
         dataController.load()

        
    }
    




    func sceneDidEnterBackground(_ scene: UIScene) {
    //    saveContext()
    }
    
    func sceneWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    //    saveContext()
    }

    func saveContext() {
        try? dataController.viewContext.save()
    }

    


    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }




}

