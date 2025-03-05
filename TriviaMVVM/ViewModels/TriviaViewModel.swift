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
    
    // Holds a list of questions that have been presented
    private var presentedQuestions: [PresentedQuestion] = []
    
    // MARK: Computed properties
    
    // Return the most recent question
    var questionToPresent: PresentedQuestion? {
        
        if presentedQuestions.isEmpty {
            return nil
        } else {
            // We have checked to ensure the array is not
            // empty, so it's safe to force unwrap here
            return presentedQuestions.last!
        }
        
    }
        
    // MARK: Initalizer(s)
    init(
        currentResponse: Response? = nil,
        currentQuestionNumber: Int = -1
    ) {
        self.currentResponse = currentResponse
        self.currentQuestionNumber = currentQuestionNumber
        
        // Get a question from the response
        getNextQuestion()
        
    }
    
    // MARK: Function(s)
    
    // Get another question from the response
    func getNextQuestion() {
        
        if let currentResponse = self.currentResponse {

            // Advance to next question in the response
            currentQuestionNumber += 1
            
            // Get the current question from the response
            if currentQuestionNumber > currentResponse.results.count - 1 {
                
                // Quit for now...
                return
            }
            
            // Get current question from the response
            let currentQuestion = currentResponse.results[currentQuestionNumber]
            
            // Make a jumbled array of possible answers to the current question
            var possibleAnswers: [String] = []
            possibleAnswers.append(currentQuestion.correctAnswer)
            possibleAnswers.append(contentsOf: currentQuestion.incorrectAnswers)
            possibleAnswers.shuffle()
            
            // Make a new question to present
            let nextQuestion = PresentedQuestion(
                category: currentQuestion.category,
                question: currentQuestion.question,
                correctAnswer: currentQuestion.correctAnswer,
                possibleAnswers: possibleAnswers
            )
            
            // Add to the array of presented questions
            presentedQuestions.append(nextQuestion)

        }
        
        
    }
    
    
}
