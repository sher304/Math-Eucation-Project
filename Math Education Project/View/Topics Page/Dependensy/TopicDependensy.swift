//
//  TopicPresenter.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 12/05/2023.
//

import UIKit

class TopicDependensy{
    static func build() -> UIViewController{
        let vc = TopicViewController()
        let presenter = TopicPresenter(view: vc)
        vc.presenter = presenter
        
        let bookVC = BookViewController()
        let bookPresneter = BookPresenter(view: bookVC)
        presenter.bookDelegate = bookPresneter
        
        return vc
    }
}
