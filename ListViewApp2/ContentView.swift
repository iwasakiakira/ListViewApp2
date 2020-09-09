//
//  ContentView.swift
//  ListViewApp2
//
//  Created by いわし on 2020/09/09.
//  Copyright © 2020 iwasi. All rights reserved.
//
import SwiftUI
import Combine
struct ContentView: View {
    @ObservedObject var nList = namesList()
    @ObservedObject var tList = TaskList()
    @State var newTask :String = ""
    
    var addTaskBar:some View {
        HStack{
            TextField("追加してください｡",text: self.$newTask)
            Button(action: self.addnewTask, label: {Text("追加")})
        }
    }
        func addnewTask(){
            tList.tasks.append(Task(id:String( tList.tasks.count + 1), taskItem:newTask))
            self.newTask = ""
    }
    var body: some View {
        NavigationView {
            VStack {
                addTaskBar.padding()
                List {
                    ForEach(self.tList.tasks) { task in
                    Text(task.taskItem)
                    }
                    .onDelete(perform: rowRemove)
                }
                .navigationBarTitle("Taskリスト")
                 .navigationBarItems(trailing: EditButton())
        }
    }
}
    func rowRemove(offsets: IndexSet) {
        self.tList.tasks.remove(atOffsets: offsets)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
