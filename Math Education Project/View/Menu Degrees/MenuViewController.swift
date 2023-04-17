//
//  MenuViewController.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 17/04/2023.
//

import UIKit

protocol MenuViewDelegate: AnyObject{
    
    
}

class MenuViewController: UIViewController {
    
    
    var presenter: MenuPresenterDelegate!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        view.backgroundColor = .orange
    }
}

extension MenuViewController: MenuViewDelegate{
    
}
