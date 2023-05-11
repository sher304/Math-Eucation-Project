//
//  QuizPresenter.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 18/04/2023.
//

import Foundation

protocol QuizPresenterDelegate{
    init(view: QuizViewDelegate)
    func viewDidLoad()
    func getAnswerId(answers: [Answer])
    func getQuizId(id: Int)
}

class QuizPresenter: QuizPresenterDelegate{
    
    weak var view: QuizViewDelegate?
    
    var correctAnswers: [Answer] = []
    
    required init(view: QuizViewDelegate) {
        self.view = view
    }
    
    var delegate: ResultPresenterDelegate!
    let defaults = UserDefaults.standard
    
    func viewDidLoad(){
        let quizId = defaults.integer(forKey: "quizId")
        APiAuth().getQuize(topic: quizId) { data in
            switch data{
            case.success(let data):
                self.view?.getQuizez(quizes: data)
                break
            case.failure(_):
                break
            }
        }
    }
    
    var correct = 0
    var incorrect = 0
    func getAnswerId(answers: [Answer]){
        UserDefaults.resetStandardUserDefaults()
        answers.forEach { answer in
            if answer.isCorrect == true{
                correct += 1
            }else{
                incorrect += 1
            }
        }
        delegate.getAnswers(correct: correct, incorrect: incorrect)
    }
    
    func getQuizId(id: Int){
        UserDefaults.resetStandardUserDefaults()
        defaults.set(id, forKey: "quizId")
    }
}


