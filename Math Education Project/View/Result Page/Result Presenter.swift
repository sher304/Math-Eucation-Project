//
//  Result Presenter.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 21/04/2023.
//

import Foundation

protocol ResultPresenterDelegate {
    init(view: ResultViewDelegate)
    func getAnswers(answers: [Answer?])
}



class ResultPresenter: ResultPresenterDelegate{    
    weak var view: ResultViewDelegate?

    required init(view: ResultViewDelegate) {
        self.view = view
    }
    
    func getAnswers(answers: [Answer?]){
        print(answers, "results presenter")
    }
}
