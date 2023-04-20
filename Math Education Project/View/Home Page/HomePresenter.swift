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
    
    private lazy var network: Network = {
        return Network()
    }()
    
    func viewDidLoad(){
        APiAuth().getAllCourses { data in
            switch data{
            case .success(let data):
                self.homeView?.fetchCourses(courses: data)
                break
            case .failure(_):
                break
            }
        }
    }
    
    required init(homeView: HomeViewDelegate) {
        self.homeView = homeView
    }
    
}
