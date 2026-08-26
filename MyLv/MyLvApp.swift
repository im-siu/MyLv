//
//  MyLvApp.swift
//  MyLv
//
//  Created by Im gaeun on 8/25/26.
//

import SwiftUI
import SwiftData

@main
struct MyLvApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: AppStateRecord.self)
    }
}
