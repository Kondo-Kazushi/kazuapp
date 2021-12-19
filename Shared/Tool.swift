//
//  ThirdView.swift
//  kazuapp
//
//  Created by 森山真吾 on 2021/10/21.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Navigation Link")){
                    NavigationLink(destination: ThirdView_1())
                    { Text("セカンドビュー") }
                    NavigationLink(destination: ThirdView_2())
                    { Text("４つ目のビュー") }
                }
                Section(header: Text("設定")){
                    NavigationLink(destination: SettingsView())
                    { Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.green)
                        Text("設定")
                    }
                }
                Section(header: Text("Tools")){
                    NavigationLink(destination: SwiftUIsampleView())
                    { Image(systemName: "s.circle")
                            .foregroundColor(.green)
                        Text("Sample Content") }
                    NavigationLink(destination: ShareTextView())
                    { Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.green)
                        Text("テキストを共有")
                    }
                    NavigationLink(destination: RealtimeNoteEditor())
                    { Image(systemName: "note.text")
                            .foregroundColor(.green)
                        Text("RealtimeNoteの編集")
                    }
                    NavigationLink(destination: WebpageView(loadUrl: "https://fast.com/ja/").navigationTitle("Fast.com"))
                    { Image(systemName: "speedometer")
                            .foregroundColor(.green)
                        Text("Fast.com")
                    }
                    NavigationLink(destination: TodoView())
                    { Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.green)
                        Text("Todo")
                    }
                }
                .navigationTitle("Tool")
            }
            SettingsView()
        }
        
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
