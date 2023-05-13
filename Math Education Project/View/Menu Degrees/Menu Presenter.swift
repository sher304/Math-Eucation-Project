//
//  Menu Presenter.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 17/04/2023.
//

import Foundation

protocol MenuPresenterDelegate{
    init(view: MenuViewDelegate)
    func getCourseId(id: Int)
}

class MenuPresenter: MenuPresenterDelegate{
    
    private weak var view: MenuViewDelegate?
    var homeDelegate: HomePresenterDelegate!
    
    required init(view: MenuViewDelegate) {
        self.view = view
    }
    
    func getCourseId(id: Int){
        UserDefaults.resetStandardUserDefaults()
        homeDelegate.getCourseId(id: id)
    }

}
