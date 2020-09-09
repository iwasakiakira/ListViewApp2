//
//  TaskFile.swift
//  ListViewApp2
//
//  Created by いわし on 2020/09/09.
//  Copyright © 2020 iwasi. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

//↓追加
struct Task:Identifiable {
    var id = String()
    var taskItem = String()
}
//↓追加
class TaskList: ObservableObject {
    @Published var tasks = [Task]()
}
class namesList: ObservableObject {
    @Published var names : [String] = [
    "阿部",
    "石田",
    "上田",
    "遠藤",
    "及川",
    "加藤",
    "菊池",
    "工藤",
    ]
}

