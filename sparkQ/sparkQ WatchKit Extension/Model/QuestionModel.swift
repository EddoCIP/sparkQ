//
//  QuestionModel.swift
//  sparkQ WatchKit Extension
//
//  Created by Eddo Careera Iriyanto Putra on 15/07/22.
//

import Foundation
import SwiftUI

struct QuestionModel: Hashable, Comparable, Identifiable {
    static func < (lhs: QuestionModel, rhs: QuestionModel) -> Bool {
        lhs.isPinned && !rhs.isPinned
    }
    
    var id : Int = 0
    var question : String = ""
    var isChecked : Bool = false
    var isPinned : Bool = false
}

