//
//  PresentedQuestion.swift
//  TriviaMVVM
//
//  Created by Russell Gordon on 2025-03-05.
//

import Foundation

struct PresentedQuestion: Identifiable {
    
    let id = UUID()
    let category: String
    let question: String
    let correctAnswer: String
    let possibleAnswers: [String]
    var correctAnswerProvided: Bool?    // nil value means we don't know yet (no response given)
    
}
