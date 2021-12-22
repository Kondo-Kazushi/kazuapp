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
                { Image(systemName: "person.fill").foregroundColor(.green)
                    Text("Home") }
                NavigationLink(destination: SettingsView())
                { Image(systemName: "slider.horizontal.3").foregroundColor(.green)
                    Text("設定")
                }
                Section(header: Text("Tools")){
                    Section(header: Text("Navigation Link")){
                        NavigationLink(destination: ThirdView_1())
                        { Text("セカンドビュー") }
                        NavigationLink(destination: ThirdView_2())
                        { Text("４つ目のビュー") }
                    }
                    NavigationLink(destination: SecondView())
                    { Image(systemName: "map.fill").foregroundColor(.green)
                        Text("Map") }
                    NavigationLink(destination: SwiftUIsampleView())
                    { Image(systemName: "s.circle").foregroundColor(.green)
                        Text("Sample Content")
                    }
                    
                    NavigationLink(destination: ShareTextView())
                    { Image(systemName: "square.and.arrow.up").foregroundColor(.green)
                        Text("テキストを共有")
                    }
                    
                    NavigationLink(destination: RealtimeNoteEditor())
                    { Image(systemName: "note.text").foregroundColor(.green)
                        Text("RealtimeNoteの編集")
                    }
                    
                    NavigationLink(destination: WebpageView(loadUrl: "https://fast.com/ja/").navigationTitle("Fast.com"))
                    { Image(systemName: "speedometer").foregroundColor(.green)
                        Text("Fast.com")
                    }
                    
                    NavigationLink(destination: TodoView())
                    { Image(systemName: "checklist").foregroundColor(.green)
                        Text("Todo")
                    }
                    NavigationLink(destination: EventList2())
                    { Image(systemName: "checklist").foregroundColor(.green)
                        Text("DatePlanner")
                    }
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
                Section(header: Text("奉仕の記録")){
                    NavigationLink(destination: MinistryRecordTotalView())
                    { Text("合計") }
                    NavigationLink(destination: MinistryRecordMonth())
                    { Text("月ごとの記録") }
                    NavigationLink(destination: MinistryRecordMonthGoalView())
                    { Text("目標") }
                }
                Section(header: Text("RealtimeNote")){
                    NavigationLink(destination: RealtimeNote())
                    { Image(systemName: "note.text").foregroundColor(.green)
                        Text("RealtimeNote") }
                    NavigationLink(destination: RealtimeNoteEditor())
                    { Image(systemName: "pencil").foregroundColor(.green)
                        Text("Editor") }
                }
            }
            .navigationTitle("kazuapp")
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
