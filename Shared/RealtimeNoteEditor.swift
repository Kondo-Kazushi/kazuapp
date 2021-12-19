//
//  RealtimeNoteEditor.swift
//  kazuapp
//
//  Created by 近藤和志 on 2021/12/09.
//

import SwiftUI

struct RealtimeNoteEditor: View {
    
    @AppStorage("RealtimeNote") var RealtimeNote = ""
    @AppStorage("RealtimeNoteTitle") var RealtimeNoteTitle = ""
    
    
    var body: some View {
        Form {
            Section(header: Text("Realtime Note")) {
                TextField("タイトル", text: $RealtimeNoteTitle)
                TextEditor(text: $RealtimeNote)
            }
        } .navigationTitle("RealtimeNoteの編集")
    }
}

struct RealtimeNoteEditor_Previews: PreviewProvider {
    static var previews: some View {
        RealtimeNoteEditor()
    }
}

struct RealtimeNoteEditorModal: View {
    
    @AppStorage("RealtimeNote") var RealtimeNote = ""
    @AppStorage("RealtimeNoteTitle") var RealtimeNoteTitle = ""
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        Form {
            Section(header: Text("Realtime Note")) {
                TextField("タイトル", text: $RealtimeNoteTitle)
                TextEditor(text: $RealtimeNote)
            }
        } .navigationTitle("RealtimeNoteの編集")
        Button("完了") {
            dismiss()       // 現在の画面を閉じる
        }.padding()
    }
}

struct RealtimeNoteEditorModal_Previews: PreviewProvider {
    static var previews: some View {
        RealtimeNoteEditorModal()
    }
}
