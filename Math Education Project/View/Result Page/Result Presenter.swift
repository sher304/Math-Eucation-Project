//
//  Result Presenter.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 21/04/2023.
//

import Foundation

protocol ResultPresenterDelegate {
    init(view: ResultViewDelegate)
    func viewDidLoad()
    func getAnswers(correct: Int, incorrect:Int)
    
}



class ResultPresenter: ResultPresenterDelegate{    
    weak var view: ResultViewDelegate?
    
    let defaults = UserDefaults.standard
    
    func viewDidLoad(){
        view?.getAnswersData(correct: defaults.integer(forKey: "Correct"), overall: defaults.integer(forKey: "InCorrect"))
    }
    
    required init(view: ResultViewDelegate) {
        self.view = view
    }
    
    func getAnswers(correct: Int, incorrect:Int){
        defaults.set(correct, forKey: "Correct")
        let overall = correct + incorrect
        defaults.set(overall, forKey: "InCorrect")
    }
}
