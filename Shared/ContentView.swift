//
//  ContentView.swift
//  Shared
//
//  Created by 森山真吾 on 2021/10/20.
//

import SwiftUI
import WebKit


struct ContentView: View {
    @AppStorage("WindowName") var WindowName = "kazuapp"
    @AppStorage("myUrl") var myUrl = "https://www.jw.org"
    @AppStorage("myUrl2") var myUrl2 = "https://www.jw.org"
    @AppStorage("myUrl3") var myUrl3 = "https://www.jw.org"
    @AppStorage("myUrl4") var myUrl4 = "https://www.jw.org"
    @AppStorage("myUrl5") var myUrl5 = "https://www.jw.org"
    var body: some View {
        NavigationView{
            List {
                NavigationLink(destination: HomeView())
                { Image(systemName: "person.fill")
                    Text("Home") }
                Section(header: Text("Tool")){
                    NavigationLink(destination: ThirdView_1())
                    { Text("セカンドビュー") }
                    NavigationLink(destination: ThirdView_2())
                    { Text("４つ目のビュー") }
                }
                Section(header: Text("Web")){
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
                }
                NavigationLink(destination: SecondView().navigationBarHidden(true))
                { Image(systemName: "map.fill")
                    Text("Map") }
                
                MinistryRecordView()
                    .tabItem{ Image(systemName: "calendar.badge.plus")
                        Text("奉仕の記録")
                    }
                ThirdView()
                    .tabItem { Image(systemName: "command.square.fill")
                        Text("Tool")
                    }
                FourthView()
                    .tabItem { Image(systemName: "network")
                        Text("Web")
                    }
                RealtimeNote()
                    .tabItem { Image(systemName: "note.text")
                        Text("RealtimeNote")
                    }
            }
            HomeView()
                .navigationTitle("\(WindowName)")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
