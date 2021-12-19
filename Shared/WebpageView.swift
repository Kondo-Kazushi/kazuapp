//
//  WebpageView.swift
//  kazuapp
//
//  Created by 森山真吾 on 2021/10/23.
//

import SwiftUI
import WebKit

struct WebpageView: UIViewRepresentable {
    var loadUrl:String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: loadUrl)!))
    }
}
