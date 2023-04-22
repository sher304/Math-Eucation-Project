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
    func getAnswers(answers: [Answer])
    var answersData: [Answer] { get set }
    
}



class ResultPresenter: ResultPresenterDelegate{    
    weak var view: ResultViewDelegate?
    
    var answersData: [Answer] = []
    
    let defaults = UserDefaults.standard
    
    func viewDidLoad(){
//        if let data = UserDefaults.standard.object(forKey: "ResultsData") as? Data,
//           let answers = try? JSONDecoder().decode([Answer].self, from: data) {
//            view?.getAnswersData(answers: answers)
//        }
        print(answersData)
    }
    
    required init(view: ResultViewDelegate) {
        self.view = view
    }
    
    func getAnswers(answers: [Answer]){
        print(answers)
    
//        if let encoded = try? JSONEncoder().encode(answers) {
//            UserDefaults.standard.set(encoded, forKey: "ResultsData")
//        }
    }
}
