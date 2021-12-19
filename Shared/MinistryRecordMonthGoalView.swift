//
//  MinistryRecordMonthGoalView.swift
//  kazuapp (iOS)
//
//  Created by 近藤和志 on 2021/12/18.
//

import SwiftUI

class MinistryGoal: ObservableObject {
    /// ユーザ名
    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
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
        username = UserDefaults.standard.string(forKey: "username") ?? ""
        level = UserDefaults.standard.object(forKey: "level") as? Int ?? 50
    }
}

struct MinistryRecordMonthGoalView: View {
    @ObservedObject var goal = MinistryGoal()
    var body: some View {
        List{
            Stepper(value: $goal.level, in: 1...200) {
                Text("時間 : \(goal.level)")
                if goal.level == 50 {
                    Text("補助開拓奉仕")
                }else if goal.level == 70 {
                    Text("正規開拓奉仕！")
                }else if goal.level == 30 {
                    Text("臨時の補助開拓奉仕")
                }else {
                    Text("")
                }
            }
        }.navigationTitle("目標")
    }
}

struct MinistryRecordMonthGoalView_Previews: PreviewProvider {
    static var previews: some View {
        MinistryRecordMonthGoalView()
    }
}
