//
//  Onboarding.swift
//  sparkQ WatchKit Extension
//
//  Created by Aditya Cahyo on 21/07/22.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 15) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("The key to spark intimacy")
                        Text("Provide recomendation question for couple to make conversation more exciting")
                            .font(.footnote)
                            .opacity(0.6)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 9).opacity(0.1))
                }
                
                SwipeInstructions()
                
                Button("Done") {
                    print("Hello")
                    UserDefaults.standard.set(true, forKey: "isDoneOnboarding")
                }
                .tint(.blue)
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

struct SwipeInstructions: View {
    var body: some View {
        VStack {
            HStack {
                Image("swipe-left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                VStack(alignment: .leading) {
                    Text("Swipe Left")
                    Text("To mark the question that has been asked")
                        .font(.footnote)
                        .opacity(0.6)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 9).opacity(0.1))
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Swipe Right")
                    Text("To save / bookmark the question and moved to top position")
                        .font(.footnote)
                        .opacity(0.6)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 9).opacity(0.1))
                Image("swipe-right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
            }
        }
    }
}
