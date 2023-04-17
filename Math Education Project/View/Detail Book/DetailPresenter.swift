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
        print("View Did Load Detail Page")
    }
    
}
