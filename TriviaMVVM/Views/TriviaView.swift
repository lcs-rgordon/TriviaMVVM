//
//  ContentView.swift
//  TriviaMVVM
//
//  Created by Russell Gordon on 2025-03-04.
//

import SwiftUI

struct TriviaView: View {
    
    // MARK: Stored properties
    
    // The view model
    @State var viewModel = TriviaViewModel(currentResponse: exampleResponse)
    
    // Feedback to user
    @State var feedback = ""
    
    // MARK: Computed properties
    
    // The user interface
    var body: some View {
        VStack {
            
            // Show a series of questions, if any exist in the view model
            if let questionToPresent = viewModel.questionToPresent {
                
                Text(questionToPresent.question)
                    .font(.title)
                
                Spacer()
                
                // Create four buttons out of the possible answers
                ForEach(questionToPresent.possibleAnswers, id: \.self) { currentAnswer in
                    
                    Button {
                        viewModel.saveAndCheck(guess: currentAnswer)
                    } label: {
                        Text(currentAnswer)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom, 20)

                }
                
                Spacer()

                VStack {
                    if let correctAnswerProvided = questionToPresent.correctAnswerProvided {
                        Text(correctAnswerProvided ? "Correct!" : "Not quite 😕")
                            .font(.title)
                    }
                }
                .frame(height: 100)

                
            } else {
                ProgressView()
            }
            
        }
        .padding()
        .navigationTitle("Trivia Game")
    }
}

#Preview {
    NavigationStack {
        TriviaView()
    }
}
