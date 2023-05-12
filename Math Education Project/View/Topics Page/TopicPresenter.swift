//
//  TopicPresenter.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 12/05/2023.
//

import Foundation

protocol TopicPresenterDelegate {
    init(view: TopicViewDelegate)
    
}

class TopicPresenter: TopicPresenterDelegate{

    weak var view: TopicViewDelegate?
    
    required init(view: TopicViewDelegate) {
        self.view = view
    }
    
}

