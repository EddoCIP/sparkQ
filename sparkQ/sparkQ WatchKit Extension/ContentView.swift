//
//  ContentView.swift
//  sparkQ WatchKit Extension
//
//  Created by Eddo Careera Iriyanto Putra on 14/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var questionList : [QuestionModel] = Questions.list
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var questions : FetchedResults <Question>
    var body: some View {
        let pinnedQuestions = self.questions.filter({a in a.isPinned == true }).sorted {$0.id < $1.id}
        let unPinnedQuestions = self.questions.filter({a in a.isPinned == false && a.isChecked == false }).sorted {$0.id < $1.id}
        let checkedQuestions = self.questions.filter({a in a.isChecked == true }).sorted {$0.id < $1.id}
        let allList = pinnedQuestions + unPinnedQuestions + checkedQuestions
        
        List{
            ForEach(allList){ question in
                ListItem(question: question)
            }
        }
        .listStyle(CarouselListStyle())
        .onAppear(){
	            if questions.isEmpty {
                
                for q in 0...questionList.count-1 {
                   saveData(q: q)
                }
            }
        }
    }
    func saveData(q: Int){
        let question = Question(context: moc)
        question.idQ = UUID()
        question.question = questionList[q].question
        question.id = questionList[q].id
        question.isChecked = questionList[q].isChecked
        question.isPinned = questionList[q].isPinned
        question.type = 0
        try?moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
