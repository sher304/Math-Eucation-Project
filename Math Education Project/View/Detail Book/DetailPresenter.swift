//
//  DetailPresenter.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 17/04/2023.
//

import Foundation

protocol DetailPresenterDelegate {
    init(view: DetailViewController)
    func viewDidLoad()
    
}

class DetailPresenter: DetailDependensy{
    
    private weak var view: DetailViewDelegate?
    
    required init(view: DetailViewController){
        self.view = view
    }
    
    func viewDidLoad(){
        APiAuth().getTopics { data in
            switch data{
            case.success(let data):
                self.view?.fetchTopics(topics: data)
                break
            case.failure(_):
                break
            }
        }
    }
    
}
