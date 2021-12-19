//
//  PopupWebView.swift
//  kazuapp
//
//  Created by 近藤和志 on 2021/12/10.
//

import SwiftUI

struct PopupWebView: View {
    @Binding var isPresent: Bool
    @AppStorage("IntroduceUrl") var IntroduceUrl = "https://kazusite.github.io/aboutme"
    var body: some View {
        VStack(spacing: 12) {
            WebpageView(loadUrl: "\(IntroduceUrl)")
            Button(action: {
                withAnimation {
                    isPresent = false
                }
            }, label: {
                Text("Close")
            })
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}


