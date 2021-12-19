//
//  RecordModelMonth.swift
//  kazuapp (iOS)
//
//  Created by 近藤和志 on 2021/12/18.
//

import Foundation

final class TodoModel: ObservableObject {
    @Published var taskList: [Task] = createTaskList()
}
