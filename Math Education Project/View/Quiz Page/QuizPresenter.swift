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
        APiAuth().getQuize(topic: 2) { data in
            switch data{
            case.success(let data):
                self.view?.getQuizez(quizes: data)
                break
            case.failure(_):
                break
            }
        }
    }
    
    func getAnswerId(answers: [Answer]){
        print(answers)
//        delegate.getAnswers(answers: answers)
    }
}
