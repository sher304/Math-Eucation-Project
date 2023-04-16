//
//  ViewController.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 16/04/2023.
//

import UIKit

protocol HomeViewDelegate: AnyObject{
    
}

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints(){
        
    }
    
}


extension HomeViewController: HomeViewDelegate{
    
    
}
