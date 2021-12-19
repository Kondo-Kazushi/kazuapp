//
//  MinistryRecord.swift
//  kazuapp (iOS)
//
//  Created by 近藤和志 on 2021/12/18.
//

import SwiftUI

struct MinistryRecordView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: MinistryRecordTotalView())
                { Text("合計")}
                NavigationLink(destination:
                                MinistryRecordMonth())
                { Text("月ごとの記録")}
                NavigationLink(destination:
                                MinistryRecordMonthGoalView())
                { Text("目標")}
            }.navigationTitle("奉仕の記録")
            MinistryRecordTotalView()
        }
        
    }
}

struct MinistryRecordView_Previews: PreviewProvider {
    static var previews: some View {
        MinistryRecordView()
    }
}
