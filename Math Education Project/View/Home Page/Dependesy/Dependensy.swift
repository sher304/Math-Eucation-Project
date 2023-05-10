//
//  Dependensy.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 16/04/2023.
//

import UIKit


class HomeDependensy{

    static func build() -> UIViewController{
        let homeView = HomeViewController()
        let presenter = HomePresneter(homeView: homeView)
        homeView.presenter = presenter
        
        let detailV = DetailViewController()
        let detailPresenter = DetailPresenter(view: detailV)
        presenter.delegate = detailPresenter
        return homeView
    }
}
