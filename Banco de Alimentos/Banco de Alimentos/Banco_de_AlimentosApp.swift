//
//  Banco_de_AlimentosApp.swift
//  Banco de Alimentos
//
//  Created by Team2 on 29/08/21.
//

import SwiftUI
import Firebase
import FBSDKCoreKit

@main
struct Banco_de_AlimentosApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            let viewModel = FirebaseAuth()
            ContentView()
                .onOpenURL(perform: { url in
                    ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: UIApplication.OpenURLOptionsKey.annotation)
                })
                .environmentObject(viewModel)
            
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        // Initialize Facebook SDK
        FBSDKCoreKit.ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
        return true
    }
}
