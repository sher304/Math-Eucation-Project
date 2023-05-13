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
    
    let defautls = UserDefaults.standard
    
    required init(view: DetailViewController){
        self.view = view
    }
    
    func viewDidLoad(){
        let unitId = defautls.integer(forKey: "unitID")
        APiAuth().getUnit { data in
            switch data{
            case.success(let datas):
                self.view?.fetchTopics(unit: datas.filter({$0.course == unitId}))
                break
            case.failure(_):
                break
            }
        }
    }
    
    func getUnitId(id: Int){
        defautls.set(id, forKey: "unitID")
    }
}
