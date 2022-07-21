//
//  ContentView.swift
//  sparkQ WatchKit Extension
//
//  Created by Eddo Careera Iriyanto Putra on 14/07/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isDoneOnboarding") var isDoneOnboarding = false
    
    var body: some View {
        if isDoneOnboarding {
            QuestionList()
        } else {
            Onboarding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
