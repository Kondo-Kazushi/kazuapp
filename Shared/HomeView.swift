//
//  HomeView.swift
//  kazuapp
//
//  Created by 森山真吾 on 2021/10/21.
//

import SwiftUI
import Foundation

struct HomeView: View {
    @State private var show: Bool = false
    @AppStorage("Nickname") var nickname = "ゲスト"
    @AppStorage("Introduce") var introduce = "自己紹介"
    @AppStorage("IntroduceUrl") var IntroduceUrl = "https://kazusite.github.io/aboutme"
    @AppStorage("IntroduceUrlTitle") var IntroduceUrlTitle = "かずしのポートフォリオ"
    @State private var showingModal = false
    @ObservedObject var goal = MinistryGoal()
    
    var body: some View
    {
        if UIDevice.current.userInterfaceIdiom == .phone {
            ScrollView{
                VStack {
                    Usericon()
                        .frame(width: 120)
                        .padding()
                    VStack(alignment: .leading) {
                        Text("ようこそ、 \(nickname)さん")
                            .font(.title)
                            .padding(.top)
                        Text("\(introduce)")
                        Text("目標奉仕時間 : \(goal.level)\n")
                        Button("\n\(IntroduceUrlTitle)\n") {
                            // ボタンアクション:
                            // ContentViewが持つshowingModal(self.showingModal)の切り替え
                            self.showingModal.toggle()
                        }.sheet(isPresented: $showingModal) {
                            ModalWebView()
                        }
                        
                        
                    }
                }
                .fixedSize()
            }
            
        }else if UIDevice.current.userInterfaceIdiom == .pad {
            VStack {
                Usericon()
                    .padding()
                VStack(alignment: .leading) {
                    Text("ようこそ、 \(nickname)さん")
                        .font(.title)
                        .padding(.top)
                    Text("\n\(introduce)\n")
                    Text("目標奉仕時間 : \(goal.level)\n")
                    HStack {
                        Image(systemName: "house.fill")
                        Button("\(IntroduceUrlTitle)") {
                            // ボタンアクション:
                            // ContentViewが持つshowingModal(self.showingModal)の切り替え
                            self.showingModal.toggle()
                        }.sheet(isPresented: $showingModal) {
                            ModalWebView()
                            
                            
                        }
                    }
                    
                }
            }
            .fixedSize()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
