//
//  TopicPresenter.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 12/05/2023.
//

import Foundation

protocol TopicPresenterDelegate {
    init(view: TopicViewDelegate)
    func viewDidLoad()
    func getTopicId(id: Int)
}

class TopicPresenter: TopicPresenterDelegate{
    
    weak var view: TopicViewDelegate?
    var bookDelegate: BookPresenterDelegate!
    
    let defautls = UserDefaults.standard
    
    func viewDidLoad(){
        let unitId = defautls.integer(forKey: "unitID")
        APiAuth().getTopics { data in
            switch data{
            case.success(let data):
                self.view?.getTopics(topic: data.filter({$0.id == unitId}))
                break
            case.failure(_):
                break
            }
        }
    }
    
    required init(view: TopicViewDelegate) {
        self.view = view
    }
    
    func getTopicId(id: Int) {
        UserDefaults.resetStandardUserDefaults()
        bookDelegate.getId(id: id)
    }
    
}

