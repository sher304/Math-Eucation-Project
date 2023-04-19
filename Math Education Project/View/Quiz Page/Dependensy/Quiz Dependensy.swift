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
        view.presenter = presenter
        return view
    }
    
}
