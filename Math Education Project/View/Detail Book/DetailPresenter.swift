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
    func getUnitId(id: Int)
    
}

class DetailPresenter: DetailPresenterDelegate{
    
    private weak var view: DetailViewDelegate?
    
    var delegate: BookPresenterDelegate!
    let defautls = UserDefaults.standard
    
    required init(view: DetailViewController){
        self.view = view
    }
    
    func viewDidLoad(){
        let unitId = defautls.integer(forKey: "unitID")
        APiAuth().getUnit(id: unitId) { data in
            switch data{
            case.success(let data):
                self.view?.fetchTopics(unit: [data])
                break
            case.failure(_):
                break
            }
        }
    }
    
    func getUnitId(id: Int){
        defautls.set(id, forKey: "unitID")
    }
    
    func getById(id: Int){
        UserDefaults.resetStandardUserDefaults()
        delegate.getId(id: id)
    }
}
