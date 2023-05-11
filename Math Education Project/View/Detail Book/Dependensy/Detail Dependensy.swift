//
//  Detail Dependensy.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 17/04/2023.
//

import UIKit

class DetailDependensy{
    
    static func build() -> UIViewController{
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view)
        view.presenter = presenter
        
        let bookVC = BookViewController()
        let bookPresneter = BookPresenter(view: bookVC)
        presenter.delegate = bookPresneter
        
        return view
    }
}
