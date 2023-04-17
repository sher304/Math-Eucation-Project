//
//  HomePresenter.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 16/04/2023.
//

import Foundation

protocol HomePresenterDelegate{
    init(homeView: HomeViewDelegate)
    func viewDidLoad()
}


class HomePresneter: HomePresenterDelegate{
    
    
    private weak var homeView: HomeViewDelegate?
    
    func viewDidLoad(){
        print("did load")
    }
    
    required init(homeView: HomeViewDelegate) {
        self.homeView = homeView
    }
    
}
