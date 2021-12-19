//
//  FourthView.swift
//  kazuapp
//
//  Created by 森山真吾 on 2021/10/22.
//

import SwiftUI
import WebKit

struct FourthView: View {
    @AppStorage("myUrl") var myUrl = "https://www.jw.org"
    @AppStorage("myUrl2") var myUrl2 = "https://www.jw.org"
    @AppStorage("myUrl3") var myUrl3 = "https://www.jw.org"
    @AppStorage("myUrl4") var myUrl4 = "https://www.jw.org"
    @AppStorage("myUrl5") var myUrl5 = "https://www.jw.org"
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Recommend")){
                    NavigationLink(destination: WebpageView(loadUrl: "https://www.jw.org/ja").navigationTitle("JW.ORG")
                                    .ignoresSafeArea(edges: .horizontal))
                    { Text("JW.ORG") }
                    NavigationLink(destination: WebpageView(loadUrl: "https://wol.jw.org/ja").navigationTitle("オンラインライブラリー")
                                    .ignoresSafeArea(edges: .horizontal))
                    { Text("ものみの塔オンラインライブラリー") }
                }
                Section(header: Text("Bookmarks")){
                    NavigationLink(destination: WebpageView(loadUrl: "\(myUrl)").navigationTitle("\(myUrl)"))
                    { Text("ブックマーク1（\(myUrl)）") }
                    NavigationLink(destination: WebpageView(loadUrl: "\(myUrl2)").navigationTitle("\(myUrl2)"))
                    { Text("ブックマーク2（\(myUrl2)）") }
                    NavigationLink(destination: WebpageView(loadUrl: "\(myUrl3)").navigationTitle("\(myUrl3)"))
                    { Text("ブックマーク3（\(myUrl3)）") }
                    NavigationLink(destination: WebpageView(loadUrl: "\(myUrl4)").navigationTitle("\(myUrl4)"))
                    { Text("ブックマーク4（\(myUrl4)）") }
                    NavigationLink(destination: WebpageView(loadUrl: "\(myUrl5)").navigationTitle("\(myUrl5)"))
                    { Text("ブックマーク5（\(myUrl5)）") }
                    
                    
                }
                Section(header: Text("設定")){
                    NavigationLink(destination: SettingsView())
                    { Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.green)
                        Text("設定") }
                }
                .navigationTitle("Web")
            }
            WebViewHome()
        }
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
