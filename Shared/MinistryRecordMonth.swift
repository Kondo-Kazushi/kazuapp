//
//  MinistryRecordMonth.swift
//  kazuapp (iOS)
//
//  Created by 近藤和志 on 2021/12/18.
//

import SwiftUI

class MinistryRecord: ObservableObject {
    /// ユーザ名
    @Published var time: Int {
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
        time = UserDefaults.standard.object(forKey: "time") as? Int ?? 0
        level = UserDefaults.standard.object(forKey: "level") as? Int ?? 50
    }
}

var timeString: String = String("\(time)")

struct MinistryRecordMonth: View {
    @ObservedObject var goal = MinistryGoal()
    @ObservedObject var ministryrecord = MinistryRecord()
    
    var body: some View {
        VStack {
            ScrollView {
                NavigationLink(destination: MinistryRecord1(),label: {Text("1月")})
                NavigationLink(destination: MinistryRecord2(),label: {Text("2月")})
                
                
                
                ForEach(3..<13) { monthindex in
                    NavigationLink(
                        destination:
                            VStack{
                                Text("\(monthindex)")
                                Form {
                                    Stepper(value: $ministryrecord.time, in: 1...200) {
                                        Text("時間 : \(ministryrecord.time)")
                                        if goal.level <= ministryrecord.time {
                                            Text("目標達成！")
                                        }else{
                                            Text("目標未達成")
                                        }
                                    }
                                }

                        Text(timeString)
                        if monthindex == 12 {
                            Text("今年もお疲れ様")
                        }
                        },
                        label: {
                            Text("\(monthindex)月")
                                .padding()
                                .frame(maxWidth: .infinity)
                        }).navigationTitle("月ごとの記録")
                }
            }
            Text("")
        }
        
    }
}

struct MinistryRecordMonth_Previews: PreviewProvider {
    static var previews: some View {
        MinistryRecordMonth()
    }
}
