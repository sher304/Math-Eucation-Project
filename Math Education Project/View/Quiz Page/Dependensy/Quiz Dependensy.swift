//
//  Quiz Dependensy.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 18/04/2023.
//

import UIKit

class QuizDependensy{
    
    static func build() -> UIViewController{
        let view = QuizViewController()
        let presenter = QuizPresenter(view: view)
        let resultVC = ResultViewController()
        let presenterResult = ResultPresenter(view: resultVC)
        view.presenter = presenter
        presenter.delegate = presenterResult
        return view
    }
    
}
