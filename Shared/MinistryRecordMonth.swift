//
//  MinistryRecordMonth.swift
//  kazuapp (iOS)
//
//  Created by 近藤和志 on 2021/12/18.
//

import SwiftUI

class MinistryRecord: ObservableObject {
    /// ユーザ名
    @Published var time: Double {
        didSet {
            UserDefaults.standard.set(time, forKey: "time")
        }
    }
    
    /// レベル
    @Published var level: Int {
        didSet {
            UserDefaults.standard.set(level, forKey: "level")
        }
    }
    
    /// 初期化処理
    init() {
        time = UserDefaults.standard.double(forKey: "time")
        level = UserDefaults.standard.object(forKey: "level") as? Int ?? 50
    }
}

var timeString: String = String("\(time)")

struct MinistryRecordMonth: View {
    var body: some View {
        VStack {
            ScrollView {
                ForEach(1..<13) { index in
                    NavigationLink(
                        destination:
                            VStack{
                                Text("\(index)")
                                Text("hello")
                                Text(timeString)
                            },
                        label: {
                                Text("\(index)月")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                        }).navigationTitle("月ごとの記録")
                }
            }
        }
        
    }
}

struct MinistryRecordMonth_Previews: PreviewProvider {
    static var previews: some View {
        MinistryRecordMonth()
    }
}
