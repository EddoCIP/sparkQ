//
//  QuestionModel.swift
//  sparkQ WatchKit Extension
//
//  Created by Eddo Careera Iriyanto Putra on 15/07/22.
//

import Foundation

struct QuestionModel: Hashable, Comparable {
    static func < (lhs: QuestionModel, rhs: QuestionModel) -> Bool {
        lhs.isPinned && !rhs.isPinned
    }
    
    var question : String = ""
    var isChecked : Bool = false
    var isPinned : Bool = false
}

