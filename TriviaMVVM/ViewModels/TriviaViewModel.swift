//
//  TriviaViewModel.swift
//  TriviaMVVM
//
//  Created by Russell Gordon on 2025-03-05.
//

import Foundation

@Observable
class TriviaViewModel {
    
    // MARK: Stored properties
    
    // Whatever response has been most recently downloaded from the endpoint
    private var currentResponse: Response?
    
    // Which question we are currently showing from the current response
    private var currentQuestionNumber: Int
    
    // MARK: Computed properties
    var currentQuestion: Question? {
        
        // Assuming a response has been downloaded from the endpoint, return
        // the current question to show
        if let response = currentResponse {
            
            return response.results[currentQuestionNumber]
            
        } else {
            
            return nil
            
        }
        
    }
    
    // MARK: Initalizer(s)
    init(
        currentResponse: Response? = nil,
        currentQuestionNumber: Int = 0
    ) {
        self.currentResponse = currentResponse
        self.currentQuestionNumber = currentQuestionNumber
    }
    
}
