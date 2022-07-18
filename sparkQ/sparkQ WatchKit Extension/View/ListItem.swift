//
//  ListItem.swift
//  sparkQ WatchKit Extension
//
//  Created by Aditya Cahyo on 18/07/22.
//

import SwiftUI

struct ListItem: View {
    @Binding var question: QuestionModel
    
    var body: some View {
        QuestionCard(counter: question.id, question: question)
            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                Button {
                    withAnimation {
                        question.isPinned.toggle()
                        if question.isChecked {
                            question.isChecked = false
                        }
                    }
                } label: {
                    Image(systemName: question.isPinned ? "pin.slash.fill" : "pin")
                }
            }
            .tint(question.isPinned ? .cyan.opacity(0.4) : .orange.opacity(0.4))
        
            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                Button {
                    withAnimation {
                        question.isChecked.toggle()
                        if question.isPinned {
                            question.isPinned = false
                        }
                    }
                } label: {
                    Image(systemName: question.isChecked ? "xmark" : "checkmark")
                }
            }
            .tint(question.isChecked ? .red.opacity(0.4) : .green.opacity(0.4))
    }
}
