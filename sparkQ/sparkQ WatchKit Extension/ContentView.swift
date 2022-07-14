//
//  ContentView.swift
//  sparkQ WatchKit Extension
//
//  Created by Eddo Careera Iriyanto Putra on 14/07/22.
//

import SwiftUI

struct ContentView: View {
    var questions: [String] = [
        "Given the choice of anyone in the world, whom would you want as a dinner guest?",
        "What does friendship mean to you?"
    ]
    
    var body: some View {
        List(Array(zip(questions.indices, questions)), id: \.0) { index, i in
            CustomListItem(counter: index + 1, text: i)
        }
        .listStyle(CarouselListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
