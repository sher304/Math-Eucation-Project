//
//  Dependensy.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 22/04/2023.
//

import UIKit


class BookDependensy {
    
    static func build() -> UIViewController{
        let view = BookViewController()
        let presenter = BookPresenter(view: view)
        view.presenter = presenter
        
        let quizVC = QuizViewController()
        let quizPresenter = QuizPresenter(view: quizVC)
        presenter.quizPresenter = quizPresenter
        
        return view
    }
}
