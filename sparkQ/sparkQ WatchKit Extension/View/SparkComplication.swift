//
//  SparkComplication.swift
//  sparkQWatch WatchKit Extension
//
//  Created by Muhammad Aleandro on 18/07/22.
//

import SwiftUI
import ClockKit
struct SparkComplication: View {
    var body: some View {
        Text("Hello World!")
    }
}
struct CircularComplicationView: View {
    var body: some View {
        ZStack{
            HStack{
                Image("Complication/Circular")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .leading
                    )
            }
        }
    }
    
}
struct RectangularComplicationView: View {
    var body: some View {
        HStack {
            CircularComplicationView()
            
            HStack {
                Text("Let's get closer")
                Spacer()
            }
        }
    }
    
}

struct SparkComplication_Previews: PreviewProvider {
    static var previews: some View {
        CLKComplicationTemplateGraphicCircularView(CircularComplicationView())
            .previewContext()
        
        
        CLKComplicationTemplateGraphicRectangularFullView(RectangularComplicationView())
            .previewContext()
    }
}
