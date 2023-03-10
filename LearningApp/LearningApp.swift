//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Sean.Lacey on 3/10/23.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(ContentModel())
        }
    }
}
