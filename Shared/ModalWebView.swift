//
//  ModalWebView.swift
//  kazuapp
//
//  Created by 近藤和志 on 2021/12/10.
//

import SwiftUI

struct ModalWebView: View {
    @Environment(\.presentationMode) private var presentationMode
    @AppStorage("IntroduceUrl") var IntroduceUrl = "https://kazusite.github.io/aboutme"
    var body: some View {
        VStack{
            
            WebpageView(loadUrl: "\(IntroduceUrl)")
            Button("閉じる") {
                self.presentationMode.wrappedValue.dismiss()
            }.padding()
        }
    }
}

struct ModalWebView_Previews: PreviewProvider {
    static var previews: some View {
        ModalWebView()
    }
}
