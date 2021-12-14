//
//  SwitchView.swift
//  DiaryApp
//
//  Created by Naimul Hasan on 13/12/21.
//

import Foundation
import SwiftUI


public class SwitchView {
    public static func goToDiaryEntryView(viewModel: AppViewModel) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: DiaryEntryView()
                                                                .environmentObject(viewModel))
            window.makeKeyAndVisible()
        }
    }
    
    public static func goToLoginView(viewModel: AppViewModel) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: LoginView()
                                                                .environmentObject(viewModel))
            window.makeKeyAndVisible()
        }
    }
    
    public static func goToContentView(viewModel: AppViewModel) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: ContentView()
                                                                .environmentObject(viewModel))
            window.makeKeyAndVisible()
        }
    }
    
    public static func goToSignInView(viewModel: AppViewModel) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: SignInView()
                                                                .environmentObject(viewModel))
            window.makeKeyAndVisible()
        }
    }
    
    public static func goToShowDiaryEntry(title: String, description: String, date: String, viewModel: AppViewModel) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: ShowDiaryEntry(title: title, description: description, date: date)
                                                                .environmentObject(viewModel))
            window.makeKeyAndVisible()
        }
    }
    
    public static func gotToShowDiaryEntryForCalander(title: String, description: String, date: String, viewModel: AppViewModel) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: ShowDiaryEntryForCalander(title: title, description: description, date: date)
                                                                .environmentObject(viewModel))
            window.makeKeyAndVisible()
        }
    }
    
    public static func goToShowCalanderView(viewModel: AppViewModel) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: ShowCalanderView()
                                                                .environmentObject(viewModel))
            window.makeKeyAndVisible()
        }
    }
}
