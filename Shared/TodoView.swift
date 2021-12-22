//
//  TodoView.swift
//  kazuapp (iOS)
//
//  Created by 近藤和志 on 2021/12/18.
//

import SwiftUI
struct TodoView: View, InputViewDelegate {
    @State var todos: [String] = []
    @State private var showingModal = false

    var body: some View {
        
        ZStack {
            List {
                ForEach(todos, id: \.self) { user in
                    Text(user)
                }
                .onDelete(perform: delete)
                Button(action: {
                    self.showingModal.toggle()
                }) {
                    HStack{
                        Image(systemName: "text.badge.plus")
                        Text("追加")
                    }
                }.sheet(isPresented: $showingModal) {
                    InputView(delegate: self, text: "")
                }
            }
        }
        .onAppear {
            if let todos = UserDefaults.standard.array(forKey: "TODO") as? [String] {
                self.todos = todos
            }
        }
        .navigationTitle("ToDo")
        .navigationBarItems(trailing: EditButton())
        
    }
    func delete(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
        print(todos)
        UserDefaults.standard.setValue(todos, forKey: "TODO")
    }
    func addTodo(text: String) {
        todos.append(text)
        UserDefaults.standard.setValue(todos, forKey: "TODO")
    }
}
protocol InputViewDelegate {
    func addTodo(text: String)
}


struct InputView: View {
    let delegate: InputViewDelegate
    @State var text: String
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("ToDo")){
                    TextField("やることを入力", text: $text)
                }
            }
            Button(action: {
                delegate.addTodo(text: text)
                dismiss()
            } ) {
                Text("ToDoを追加")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            Spacer()
            Button("キャンセル") {
                dismiss()       // 現在の画面を閉じる
            }
        }
        .padding()
    }
}
struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
