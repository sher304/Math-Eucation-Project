//
//  Dependensy.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 16/04/2023.
//

import UIKit


class Dependensy{
    
    
    static func build() -> UIViewController{
        let homeView = HomeViewController()
        let presenter = HomePresneter(homeView: homeView)
        homeView.presenter = presenter
        return homeView
    }
}
