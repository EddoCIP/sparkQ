//
//  ContentView.swift
//  sparkQ WatchKit Extension
//
//  Created by Eddo Careera Iriyanto Putra on 14/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var questionList : [QuestionModel] = Questions.list
    
    var body: some View {
        let pinnedQuestions = self.$questionList.filter({a in a.isPinned.wrappedValue == true }).sorted {$0.id < $1.id}
        let unPinnedQuestions = self.$questionList.filter({a in a.isPinned.wrappedValue == false && a.isChecked.wrappedValue == false }).sorted {$0.id < $1.id}
        let checkedQuestions = self.$questionList.filter({a in a.isChecked.wrappedValue == true }).sorted {$0.id < $1.id}
        let allList = pinnedQuestions + unPinnedQuestions + checkedQuestions
        
        
        List {
            ForEach(allList, id: \.id) { $question in
                ListItem(question: $question)
            }
        }
        .listStyle(CarouselListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
