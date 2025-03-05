//
//  Response.swift
//  TriviaMVVM
//
//  Created by Russell Gordon on 2025-03-05.
//

import Foundation

// Structures are on this endpoint:
//
// https://opentdb.com/api.php?amount=10&difficulty=easy&type=multiple
//
// Documentation available here:
//
// https://opentdb.com/api_config.php

struct Response: Codable {
    
    // MARK: Stored properties
    let results: [Question]
    
}

struct Question: Codable {
    
    // MARK: Stored properties
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    // MARK: Computed properties
    
    // For convenience in the view, return a randomized
    // list of all the answers
    var allAnswers: [String] {
        
        // Create an empty array
        var answers: [String] = []
        
        // Add the correct answer
        answers.append(correctAnswer)
        
        // Add the incorrect answers
        answers.append(contentsOf: incorrectAnswers)
        
        // Return an array with the order of answers
        // shuffled (mixed up)
        return answers.shuffled()
    }
    
    // MARK: Enumerations
    
    // Provide decoding hints to Swift compiler
    // This allows us to rename properties
    enum CodingKeys: String, CodingKey {
        
        case category
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
        
    }
    
}

// Create an example response for testing purposes
let exampleResponse = Response(
    
    results: [
        
        Question(
            category: "General Knowledge",
            question: "Of the following months, which has the most days?",
            correctAnswer: "December",
            incorrectAnswers: [
                "April",
                "February",
                "September"
            ]
        ),
        
        Question(
            category: "Mythology",
            question: "In Greek mythology, who led the Argonauts in search of the Golden Fleece?",
            correctAnswer: "Jason",
            incorrectAnswers: [
                "Castor",
                "Daedalus",
                "Odysseus"
            ]
        ),


        Question(
            category: "Sports",
            question: "Which NFL team plays for New England?",
            correctAnswer: "Patriots",
            incorrectAnswers: [
                "Chiefs",
                "Dolphins",
                "49ers"
            ]
        ),
        
        
        
    ]
    
)
