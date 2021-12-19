//
//  RealtimeNote.swift
//  kazuapp
//
//  Created by 近藤和志 on 2021/12/09.
//

import SwiftUI

struct RealtimeNote: View {
    
    @AppStorage("RealtimeNote") var RealtimeNote = ""
    @AppStorage("RealtimeNoteTitle") var RealtimeNoteTitle = ""
    @State private var showActivityView: Bool = false
    @State private var shareItem: String = ""
    @State private var showingModal = false
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    
    
    
    var body: some View {
        
        VStack {
            HStack{
            }
            ScrollView(.vertical, showsIndicators: true){
                Text("\(RealtimeNote)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .navigationTitle("\(RealtimeNoteTitle)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    self.showingModal.toggle()
                }) {
                    Text("Edit")
                }.sheet(isPresented: $showingModal) {
                    RealtimeNoteEditorModal()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {self.showActivityView = true})
                {
                    Image(systemName: "square.and.arrow.up")
                }
                .sheet(isPresented: self.$showActivityView) {
                    ShareSheet(text: $RealtimeNote)
                }
            }
        }
        .padding()
    }
}

struct RealtimeNote_Previews: PreviewProvider {
    static var previews: some View {
        RealtimeNote()
    }
}
