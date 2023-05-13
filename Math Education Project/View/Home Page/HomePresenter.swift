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
    func getUnitId(id: Int)
    func getCourseId(id: Int)
}


class HomePresneter: HomePresenterDelegate{
    
    private weak var homeView: HomeViewDelegate?
    var delegate: DetailPresenterDelegate!
    
    var courses = Dynamic(Course())
    
    let defautls = UserDefaults.standard
    
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
    
    func getUnitId(id: Int){
        UserDefaults.resetStandardUserDefaults()
        delegate.getUnitId(id: id)
    }
    
    func getCourseId(id: Int){
        defautls.set(id, forKey: "courseId")
    }
    
}
