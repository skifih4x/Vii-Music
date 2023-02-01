//
//  AppDelegate.swift
//  Vii-Music
//
//  Created by Артем Орлов on 08.01.2023.
//

import UIKit
import FirebaseCore
import CoreData
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        do
        {
            try AVAudioSession.sharedInstance().setActive(true)
            try AVAudioSession.sharedInstance().setPreferredSampleRate(4096)
        }
        catch
        {
            print(error)
        }
        return true
    }
}
