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
    
    var courses: Course = Course()
    
    func viewDidLoad(){
        APiAuth().getAllCourses { data in
            switch data{
            case .success(let data):
                self.courses = data
                print(self.courses)
                break
            case .failure(_):
                break
            }
        }
        print("did load")
        
    }
    
    required init(homeView: HomeViewDelegate) {
        self.homeView = homeView
    }
    
}
