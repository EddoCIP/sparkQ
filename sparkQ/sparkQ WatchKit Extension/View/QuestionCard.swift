//
//  QuestionCard.swift
//  sparkQ WatchKit Extension
//
//  Created by Eddo Careera Iriyanto Putra on 14/07/22.
//

import SwiftUI

struct QuestionCard: View {
    var question : Question
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text("\(question.id)")
                    .bold()
                Spacer()
                Group {
                    if question.isChecked {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color.white)
                    }
                    if question.isPinned {
                        Image(systemName: "pin.circle.fill")
                            .foregroundColor(Color.white)
                            .rotationEffect(Angle(degrees: 45))
                    }
                }
                .opacity(0.7)
            }
            .padding(.vertical, 6)
            .padding(.leading, 5)
            .font(.title3)
            Text(question.question ?? "Unknown")
                .font(.footnote)
                .padding(.horizontal, 5)
        }
        .padding(.bottom, 10)
        .listRowBackground(
            LinearGradient(
                gradient:Gradient(colors: question.isPinned ? [.orange, .yellow] : [.cyan, .blue]),
                startPoint: .topTrailing,
                endPoint: .bottomLeading
            )
            .opacity(0.4)
            .clipped()
            .cornerRadius(9)
        )
    }
}

//struct QuestionCard_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionCard(counter: 0, question: QuestionModel())
//    }
//}
