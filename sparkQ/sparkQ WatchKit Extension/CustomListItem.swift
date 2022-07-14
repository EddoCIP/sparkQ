//
//  CustomListItem.swift
//  sparkQ WatchKit Extension
//
//  Created by Eddo Careera Iriyanto Putra on 14/07/22.
//

import SwiftUI

struct CustomListItem: View {
    var counter: Int
    var text: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "person")
                    .foregroundColor(Color.black)
                Image(systemName: "person")
                    .foregroundColor(Color.black)
            }.padding()
            Spacer()
            VStack(alignment: .leading) {
                Text("\(counter)")
                    .font(.caption2)
                Text(text)
                    .foregroundColor(Color.black)
                    .lineLimit(nil)
                    .minimumScaleFactor(0.8)
            }
            Spacer()
        }
        .background(Color.green)
        .cornerRadius(15)
    }
}

struct CustomListItem_Previews: PreviewProvider {
    static var previews: some View {
        CustomListItem(counter: 0, text: "INI APAAA")
    }
}
