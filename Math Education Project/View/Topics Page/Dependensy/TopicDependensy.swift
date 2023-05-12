//
//  TopicPresenter.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 12/05/2023.
//

import UIKit

class Dependensy{

    static func buiild() -> UIViewController{
        let vc = TopicViewController()
        let presenter = TopicPresenter(view: vc)
        vc.presenter = presenter
        
        return vc
    }
}
