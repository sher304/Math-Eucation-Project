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
    func getAnswerId(id: [Answer?])
}

class QuizPresenter: QuizPresenterDelegate{
    
    weak var view: QuizViewDelegate?
    
    required init(view: QuizViewDelegate) {
        self.view = view
    }
    
    var delegate: ResultPresenterDelegate!
    
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
    
    func getAnswerId(id: [Answer?]){
        delegate.getAnswers(answers: id)
    }
}
