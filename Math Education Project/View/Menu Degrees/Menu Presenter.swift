//
//  Menu Presenter.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 17/04/2023.
//

import Foundation

protocol MenuPresenterDelegate{
    init(view: MenuViewDelegate)
    
    func viewDidLoad()
}

class MenuPresenter: MenuPresenterDelegate{
    
    private weak var view: MenuViewDelegate?
    
    required init(view: MenuViewDelegate) {
        self.view = view
    }
    
    func viewDidLoad(){
        print("View Did Load")
    }
    
}
