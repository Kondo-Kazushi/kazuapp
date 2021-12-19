//
//  SwiftUIView.swift
//  kazuapp
//
//  Created by 森山真吾 on 2021/10/21.
//

import SwiftUI

struct Usericon: View {
    var body: some View {
        Image("User icon")
            .resizable().aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
           
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Usericon()
    }
}
