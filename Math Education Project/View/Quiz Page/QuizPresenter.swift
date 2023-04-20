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
}

class QuizPresenter: QuizPresenterDelegate{
    
    weak var view: QuizViewDelegate?
    
    required init(view: QuizViewDelegate) {
        self.view = view
    }
    
    func viewDidLoad(){
        APiAuth().getQuize(topic: 1) { data in
            switch data{
            case.success(let data):
                self.view?.getQuizData(quiz: data)
                break
            case.failure(_):
                break
            }
        }
        
    }
}
