//
//  SettingsView.swift
//  kazuapp
//
//  Created by 森山真吾 on 2021/10/22.
//

import SwiftUI
import Foundation
import MapKit


struct SettingsView: View {
    
    @AppStorage("Nickname") var nickname = "ゲスト"
    @AppStorage("Introduce") var introduce = "自己紹介"
    @AppStorage("Maptype") var mapType = false
    @AppStorage("Locationlatitude") var locationlatitude = 35.217502
    @AppStorage("Locationlongitude") var locationlongitude = 136.836714
    @AppStorage("myUrl") var myUrl = "https://www.jw.org"
    @AppStorage("myUrl2") var myUrl2 = "https://www.jw.org"
    @AppStorage("myUrl3") var myUrl3 = "https://www.jw.org"
    @AppStorage("myUrl4") var myUrl4 = "https://www.jw.org"
    @AppStorage("myUrl5") var myUrl5 = "https://www.jw.org"
    @AppStorage("WindowName") var WindowName = "kazuapp"
    @AppStorage("IntroduceUrl") var IntroduceUrl = "https://kazusite.github.io/aboutme"
    @AppStorage("IntroduceUrlTitle") var IntroduceUrlTitle = "かずしのポートフォリオ"
    
    
    var body: some View {
        
        Form {
            Section(header: Text("プロフィール")) {
                TextField("ニックネーム", text: $nickname)
                TextEditor(text: $introduce)
                TextField("自己紹介のURL", text: $IntroduceUrl)
                TextField("自己紹介のURLのタイトル", text: $IntroduceUrlTitle)
            }
            
            Section(header: Text("Map"), footer: Text("なぜか整数しか入力できません")) {
                TextField("緯度", value: $locationlatitude, formatter: NumberFormatter())
                    .keyboardType(.numbersAndPunctuation)
                TextField("経度", value: $locationlongitude, formatter: NumberFormatter())
                    .keyboardType(.numbersAndPunctuation)
            }
            
            Section(header: Text("Webブックマーク")) {
                TextField("ブックマーク1", text: $myUrl)
                    .autocapitalization(.none)
                    .keyboardType(.URL)
                TextField("ブックマーク2", text: $myUrl2)
                    .autocapitalization(.none)
                    .keyboardType(.URL)
                TextField("ブックマーク3", text: $myUrl3)
                    .autocapitalization(.none)
                    .keyboardType(.URL)
                TextField("ブックマーク4", text: $myUrl4)
                    .autocapitalization(.none)
                    .keyboardType(.URL)
                TextField("ブックマーク5", text: $myUrl5)
                    .autocapitalization(.none)
                    .keyboardType(.URL)
                
            }
            Section(header: Text("奉仕の目標"))  {
                NavigationLink(destination: MinistryRecordMonthGoalView())
                { Text("詳細設定") }
            }
            
            Section(header: Text("Appの設定")) {
                TextField("ウィンドウの名前", text: $WindowName)
                    .autocapitalization(.none)
            }
        }.navigationTitle("設定")
    }
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
}
