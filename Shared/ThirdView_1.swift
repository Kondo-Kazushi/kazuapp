//
//  ThirdView_1.swift
//  kazuapp
//
//  Created by 森山真吾 on 2021/10/21.
//

import SwiftUI

struct ThirdView_1: View {
    @State private var showingModal = false
    var body: some View {
        Text("aaa")
        Button("Show ModalView.") {
            // ボタンアクション:
            // ContentViewが持つshowingModal(self.showingModal)の切り替え
            self.showingModal.toggle()
        }.sheet(isPresented: $showingModal) {
            ModalWebView()
        }
        
    }
}


struct ThirdView_1_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView_1()
    }
}
