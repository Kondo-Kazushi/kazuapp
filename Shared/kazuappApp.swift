//
//  kazuappApp.swift
//  Shared
//
//  Created by 森山真吾 on 2021/10/20.
//

import SwiftUI

@main


struct kazuappApp: App {
    var body: some Scene {
        
        SwiftUI.WindowGroup {
            ContentView()
        }
        .commands {
            // (1)
            CommandMenu("MyMenu") {
                MyCommand1()
            }
        }
    }

}

struct MyCommand1: View {
    var body: some View {
        Button(action: {
            print("MyCommand1")
        }, label: {
            // (2)
            Text("MyCommand1")
        })
        // (3)
            .keyboardShortcut("1", modifiers: [.shift, .command])
    }
}
