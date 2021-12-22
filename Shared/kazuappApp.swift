//
//  kazuappApp.swift
//  Shared
//
//  Created by 森山真吾 on 2021/10/20.
//

import SwiftUI

@main

struct kazuappApp: App {
    @StateObject private var eventData = EventData()
    var body: some Scene {
        SwiftUI.WindowGroup {
            ContentView()
                .environmentObject(eventData)
        }
    }

}
