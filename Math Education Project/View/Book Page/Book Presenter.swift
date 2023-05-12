//
//  Book Presenter.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 22/04/2023.
//

import Foundation

protocol BookPresenterDelegate{
    init(view: BookViewDelegate)
    func viewDidLoad()
    func getId(id: Int)
    func getQuizId(id: Int)
}

class BookPresenter: BookPresenterDelegate{
    
    weak var view: BookViewDelegate?
    var quizPresenter: QuizPresenterDelegate!
    
    let defautls = UserDefaults.standard
    
    required init(view: BookViewDelegate){
        self.view = view
    }
    
    func viewDidLoad(){
        let id = defautls.integer(forKey: "topicId")
        APiAuth().getTopics(id: id) { data in
            switch data{
            case.success(let data):
                self.view?.getTopic(topic: [data])
                break
            case.failure(_):
                break
            }
        }
    }
    
    func getId(id: Int){
        UserDefaults.resetStandardUserDefaults()
        defautls.set(id, forKey: "topicId")
    }
    
    func getQuizId(id: Int){
        quizPresenter.getQuizId(id: id)
    }
    
}
