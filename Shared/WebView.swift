//
//  WebView.swift
//  kazuapp
//
//  Created by 森山真吾 on 2021/10/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var loadUrl:String
    var allowsInlineMediaPlayback: Bool{true}

    func makeUIView(context: Context) -> WKWebView {
      let webConfiguration = WKWebViewConfiguration()
      webConfiguration.allowsInlineMediaPlayback = true
      return WKWebView(frame: .zero, configuration: webConfiguration)
//      https://stackoverflow.com/questions/58902095/how-can-i-add-web-view-preferences-to-a-swift-ui-web-view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: loadUrl)!))
    }
}
