//
//  CustomListItem.swift
//  sparkQ WatchKit Extension
//
//  Created by Eddo Careera Iriyanto Putra on 14/07/22.
//

import SwiftUI

struct CustomListItem: View {
    var counter: Int
//    var text: String
    var question : QuestionModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                if question.isChecked {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color.black)
                }
                if question.isPinned {
                    Image(systemName: "pin.circle.fill")
                        .foregroundColor(Color.black)
                }
            }
            .padding()
//            Spacer()
            VStack(alignment: .leading) {
                Text("\(counter)")
                    .font(.caption2)
                Text(question.question)
                    .foregroundColor(Color.black)
                    .lineLimit(nil)
                    .minimumScaleFactor(0.8)
            }
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
        }
        .listRowBackground(Color.green.clipped().cornerRadius(15))
        .background(Color.green)
        .cornerRadius(15)
    }
}

struct CustomListItem_Previews: PreviewProvider {
    static var previews: some View {
        CustomListItem(counter: 0, question: QuestionModel())
    }
}
