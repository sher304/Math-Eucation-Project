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
}

class BookPresenter: BookPresenterDelegate{
    
    weak var view: BookViewDelegate?
    
    required init(view: BookViewDelegate){
        self.view = view
    }
    
    func viewDidLoad(){
        APiAuth().getTopics(id: 2) { data in
            switch data{
            case.success(let data):
                self.view?.getTopic(topic: [data])
                break
            case.failure(_):
                break
            }
        }
    }
}
