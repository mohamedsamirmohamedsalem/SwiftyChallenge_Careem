//
//  ViewController.swift
//  SwiftyChallenge
//
//  Created by Monish Syed  on 10/08/2020.
//  Copyright © 2020 Monish Syed . All rights reserved.
//

import UIKit
import Combine

class ViewController: BaseViewController {
    
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var questionBackground: UIView!
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var choice1: UILabel!
    @IBOutlet weak var choice2: UILabel!
    @IBOutlet weak var choice3: UILabel!
    @IBOutlet weak var choice4: UILabel!
    
    @IBOutlet weak var selectChoice1: UIButton!
    @IBOutlet weak var selectChoice2: UIButton!
    @IBOutlet weak var selectChoice3: UIButton!
    @IBOutlet weak var selectChoice4: UIButton!
    @IBOutlet weak var submitBut: UIButton!
    
    let viewModel = QuestionViewModel(service: NetworkService())
    var cancellables = Set<AnyCancellable>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAnswerButtons()
        bindViewModel()
    }
    
    private func setupUI(){
        submit.layer.cornerRadius = 5
        questionBackground.layer.cornerRadius = 10
        questionBackground.layer.masksToBounds = true
        question.text = "We can return multiple values from a function using?"
    }
    
    private func bindViewModel() {
        
        viewModel.showLoader
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isLoading in
                guard let self = self else {return}
                isLoading ? self.showLoader() : self.hideLoader()
            }.store(in: &cancellables)
        
        viewModel.errorMessage
            .receive(on: DispatchQueue.main)
            .sink { [weak self] message in
                guard let self = self else {return}
                self.showAlertView(title: "Error", message: message)
            }.store(in: &cancellables)
        
        viewModel.quesion
            .receive(on: DispatchQueue.main)
            .sink { [weak self] question in
                guard let self = self else {return}
                self.updateQuestion(question: question)
            }.store(in: &cancellables)
        
        viewModel.getQuestions()
    }
    
    private func setupAnswerButtons(){
        
        submitBut.publisher(for: .touchUpInside)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else {return}
                if self.viewModel.randomQuestion.answers.isEmpty {
                    showAlertView(title: "sorry", message: "There is an error, you can not continue")
                }else{
                    self.viewModel.selectedAnswer.correct ?
                    showAlertView(title: "Well Done", message: "Ur Answer is right",firstButtonHandler: {
                        self.viewModel.getRandomQuestion()
                    }) :
                    showAlertView(title: "woooo sorry", message: "Ur Answer is false")
                }
            }.store(in: &cancellables)
        
        selectChoice1.publisher(for: .touchUpInside)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else {return}
                let answerListCount = 1
                if self.viewModel.checkAnswers(count: answerListCount){
                    self.didSelectAnswer(with: selectChoice1)
                    self.viewModel.selectedAnswer = viewModel.randomQuestion.answers[answerListCount - 1]
                }
            }.store(in: &cancellables)
        
        selectChoice2.publisher(for: .touchUpInside)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else {return}
                let answerListCount = 2
                if viewModel.checkAnswers(count: answerListCount){
                    self.didSelectAnswer(with: selectChoice2)
                    self.viewModel.selectedAnswer = viewModel.randomQuestion.answers[answerListCount - 1]
                }
            }.store(in: &cancellables)
        
        selectChoice3.publisher(for: .touchUpInside)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else {return}
                let answerListCount = 3
                if self.viewModel.checkAnswers(count: answerListCount) {
                    self.didSelectAnswer(with: selectChoice3)
                    self.viewModel.selectedAnswer = viewModel.randomQuestion.answers[answerListCount - 1]
                }
            }.store(in: &cancellables)
        
        selectChoice4.publisher(for: .touchUpInside)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else {return}
                let answerListCount = 4
                if self.viewModel.checkAnswers(count: answerListCount) {
                    self.didSelectAnswer(with: selectChoice4)
                    self.viewModel.selectedAnswer = viewModel.randomQuestion.answers[answerListCount - 1]
                }
            }.store(in: &cancellables)
    }
    
    private func updateQuestion(question: Question) {
        viewModel.randomQuestion = question
        self.question.text = viewModel.randomQuestion.query
        (choice1.text, choice2.text, choice3.text, choice4.text) = question.answers.compactMap({$0.title}).tuple4 ?? ("","","","")
    }
    
    private func didSelectAnswer(with selectedBut: UIButton){
        let answerButtons = [selectChoice1, selectChoice2, selectChoice3, selectChoice4]
        _ = answerButtons.map({$0?.setImage(UIImage(named: $0 == selectedBut ? "checked-radio-button" : "unchecked-radio-button"), for: .normal)})
    }
}
