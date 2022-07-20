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
//    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "isPinned == %@", true), animation: nil) var pinnedQuestions : FetchedResults <Question>
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id)],predicate: NSPredicate(format: "isPinned == %@", NSNumber(value: true))) var pinned: FetchedResults<Question>
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id)],predicate: NSPredicate(format: "isChecked == %@", NSNumber(value: true))) var checkeds: FetchedResults<Question>
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id)],predicate: NSPredicate(format: "isChecked == %@ AND isPinned == %@", NSNumber(value: false), NSNumber(value: false))) var normals : FetchedResults<Question>
    var body: some View {
        List{
            ForEach(pinned){ question in
                ListItem(question: question)
            }
            ForEach(normals){ question in
                ListItem(question: question)
            }
            ForEach(checkeds){ question in
                ListItem(question: question)
            }
        }
        .listStyle(CarouselListStyle())
        .onAppear(){
	            if questions.isEmpty {
                for q in questionList {
                    let question = Question(context: moc)
                    question.idQ = UUID()
                    question.id = q.id
                    question.question = q.question
                    question.isChecked = q.isChecked
                    question.isPinned = q.isPinned
                }
                    try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
