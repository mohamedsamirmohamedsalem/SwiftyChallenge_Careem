//
//  ViewModel.swift
//  SwiftyChallenge
//
//  Created by Mohamed Samir on 20/02/2024.
//  Copyright © 2024 Monish Syed . All rights reserved.
//

import Foundation
import Combine

class QuestionViewModel {
    

    let service: Service
    var questions: [Question] = []
    var randomQuestion: Question = Question.defaultQuestion
    var selectedAnswer = Question.Answer(title: "", correct: false)
    var showLoader = PassthroughSubject<Bool,Never>()
    var errorMessage = PassthroughSubject<String,Never>()
    var quesion = PassthroughSubject<Question,Never>()


    
    init(service: Service) {
        self.service = service
    }
    
    func getQuestions() {
        
        guard let  url = URL(string: Endpoints.questionsURL) else {return}
        let request = QuestionsRequest(url: url)
        
        self.showLoader.send(true)
        service.get(request: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.errorMessage.send(error.localizedDescription)
            case .success(let data):
                do {
                    self.questions = try JSONDecoder().decode([Question].self, from: data)
                    self.getRandomQuestion()
                    self.showLoader.send(false)
                }catch {
                    self.showLoader.send(false)
                    errorMessage.send(error.localizedDescription)
                }
            }
        }
    }
    
     func getRandomQuestion() {
         quesion.send(questions.randomElement() ?? Question.defaultQuestion)   
     }
    
    func checkAnswers(count: Int) -> Bool {
        return randomQuestion.answers.count >= count
        
    }
}
