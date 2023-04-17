//
//  Dependensy.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 17/04/2023.
//

import UIKit

class MenuDependensy{
    
    static func build() -> UIViewController{
        let menuVC = MenuViewController()
        let presenter = MenuPresenter(view: menuVC)
        menuVC.presenter = presenter
        return menuVC
    }
}
