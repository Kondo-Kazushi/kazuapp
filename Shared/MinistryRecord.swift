//
//  MinistryRecord.swift
//  kazuapp
//
//  Created by 近藤和志 on 2021/12/19.
//

import SwiftUI

var AddWord = "追加"
var CancelWord = "キャンセル"

//MARK: 1

struct MinistryRecord1: View, InputTimeDelegate {
    @State var time1: [String] = []
    @State var times1: [Int] = []
    @State private var showingModal = false
    var body: some View {
        ZStack {
            Text("")
            List {
                ForEach(time1, id: \.self) { user in
                    NavigationLink(destination:
                                    List {
                        Text(user)
                    })
                    {Text("\(user)")}
                    
                }
                .onDelete(perform: delete)
                Button(action: {
                    self.showingModal.toggle()
                }) {
                    HStack{
                        Image(systemName: "hourglass.badge.plus")
                        Text(AddWord)
                    }
                }.sheet(isPresented: $showingModal) {
                    MinistryRecordInput1(ministryRecord1: self, time1: "")
                }
            }
        }
        .onAppear {
            if let time1 = UserDefaults.standard.array(forKey: "TIME1") as? [String] {
                self.time1 = time1
            }
        }
    }
    func delete(at offsets: IndexSet) {
        time1.remove(atOffsets: offsets)
        print(time1)
        UserDefaults.standard.setValue(time1, forKey: "TIME1")
    }
    func addTime(text: String) {
        time1.append(text)
        UserDefaults.standard.setValue(time1, forKey: "TIME1")
    }
}

struct MinistryRecord1_Previews: PreviewProvider {
    static var previews: some View {
        MinistryRecord1()
    }
}


//MARK: 2

struct MinistryRecord2: View, InputTimeDelegate {
    @State var time2: [String] = []
    @State private var showingModal = false
    var body: some View {
        ZStack {
            Text("")
            List {
                ForEach(time2, id: \.self) { user in
                    Text(user)
                }
                .onDelete(perform: delete)
                Button(action: {
                    self.showingModal.toggle()
                }) {
                    HStack{
                        Image(systemName: "hourglass.badge.plus")
                        Text(AddWord)
                    }
                }.sheet(isPresented: $showingModal) {
                    MinistryRecordInput2(ministryRecord2: self, time2: "")
                }
            }
        }
        .onAppear {
            if let time2 = UserDefaults.standard.array(forKey: "TIME2") as? [String] {
                self.time2 = time2
            }
        }
    }
    func delete(at offsets: IndexSet) {
        time2.remove(atOffsets: offsets)
        print(time2)
        UserDefaults.standard.setValue(time2, forKey: "TIME2")
    }
    func addTime(text: String) {
        time2.append(text)
        UserDefaults.standard.setValue(time2, forKey: "TIME2")
    }
}

struct MinistryRecord2_Previews: PreviewProvider {
    static var previews: some View {
        MinistryRecord2()
    }
}


//MARK: protocol

protocol  InputTimeDelegate{
    func addTime(text: String)
}

class MinistryTime1: ObservableObject {
    /// ユーザ名
    
    /// レベル
    @Published var times1: Int {
        didSet {
            UserDefaults.standard.set(times1, forKey: "times1")
        }
    }
    
    /// 初期化処理
    init() {
        times1 = UserDefaults.standard.object(forKey: "times1") as? Int ?? 0
    }
}

//Input
//MARK: 1

struct MinistryRecordInput1: View {
    let ministryRecord1: InputTimeDelegate
    @State var time1: String
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    @ObservedObject var times1 = MinistryTime1()
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("奉仕の記録")){
                    Stepper(value: $times1.times1, in: 1...200){
                        Text("\(times1.times1)")
                    }
                    TextField("奉仕時間", text: $time1)
                }
            }
            Button(action: {
                ministryRecord1.addTime(text: time1)
                dismiss()
            } ) {
                Text("記録を追加")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            Spacer()
            Button(CancelWord) {
                dismiss()       // 現在の画面を閉じる
            }
        }
        .padding()
    }
}

//MARK: 2

struct MinistryRecordInput2: View {
    let ministryRecord2: InputTimeDelegate
    @State var time2: String
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("奉仕の記録")){
                    TextField("奉仕時間", text: $time2)
                }
            }
            Button(action: {
                ministryRecord2.addTime(text: time2)
                dismiss()
            } ) {
                Text("記録を追加")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            Spacer()
            Button(CancelWord) {
                dismiss()       // 現在の画面を閉じる
            }
        }
        .padding()
    }
}

