//
//  ResultDependensy.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 21/04/2023.
//

import UIKit


class ResultDependensy{
    
    static func build() -> UIViewController{
        let view = ResultViewController()
        let presenter = ResultPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
