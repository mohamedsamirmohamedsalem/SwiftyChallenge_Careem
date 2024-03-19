//
//  Questions.swift
//  SwiftyChallenge
//
//  Created by Monish Syed  on 11/08/2020.
//  Copyright © 2020 Monish Syed . All rights reserved.
//

import Foundation

struct Question: Decodable {
    struct Answer: Decodable{
        let title: String // The prompt/title/answer choice to the question
        let correct: Bool // Is this the correct answer or not
    }
    
    let query: String // The prompt/title/question we want to ask
    let answers: [Answer] // List of answers (always 4)
    
    static var defaultQuestion: Question = Question(query: "", answers: [])
    
    static var mockedQuestions: [Question] = [
        Question(query: "how are u 1", answers: [
            Question.Answer.init(title: "good", correct: true),
            Question.Answer.init(title: "good", correct: false),
            Question.Answer.init(title: "good", correct: false),
            Question.Answer.init(title: "good", correct: false)
                                                           ]),
        Question(query: "how are u 2", answers: [
            Question.Answer.init(title: "good", correct: true),
            Question.Answer.init(title: "good", correct: false),
            Question.Answer.init(title: "good", correct: false),
            Question.Answer.init(title: "good", correct: false)
                                                           ]),
        Question(query: "how are u 3", answers: [
            Question.Answer.init(title: "good", correct: true),
            Question.Answer.init(title: "good", correct: false),
            Question.Answer.init(title: "good", correct: false),
            Question.Answer.init(title: "good", correct: false)
                                                           ]),
        Question(query: "how are u 4", answers: [
            Question.Answer.init(title: "good", correct: true),
            Question.Answer.init(title: "good", correct: false),
            Question.Answer.init(title: "good", correct: false),
            Question.Answer.init(title: "good", correct: false)
                                                           ]),
        Question(query: "how are u 5", answers: [
            Question.Answer.init(title: "good", correct: true),
            Question.Answer.init(title: "good", correct: false),
            Question.Answer.init(title: "good", correct: false),
            Question.Answer.init(title: "good", correct: false)
                                                           ]),
        Question(query: "how are u 6", answers: [
            Question.Answer.init(title: "good", correct: true),
            Question.Answer.init(title: "good", correct: false),
            Question.Answer.init(title: "good", correct: false),
            Question.Answer.init(title: "good", correct: false)
                                                           ])
    ]
}


