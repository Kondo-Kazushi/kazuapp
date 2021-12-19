//
//  TodoModalView.swift
//  kazuapp (iOS)
//
//  Created by 近藤和志 on 2021/12/18.
//

import SwiftUI

protocol InputViewDelegate {
    func addTodo(text: String)
}

struct TodoModalView: View {
    @Environment(\.presentationMode) var presentation
    let delegate: InputViewDelegate
    @State var text: String
    var body: some View {
        VStack(spacing: 16) {
            TextField("Input Your TODO", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Add") {
                delegate.addTodo(text: text)
                presentation.wrappedValue.dismiss()
            }
        }
        
        .padding()
    }
}

struct TodoModalView_Previews: PreviewProvider {
    static var previews: some View {
        TodoModalView()
    }
}
