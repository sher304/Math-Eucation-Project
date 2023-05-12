//
//  TopicViewController.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 12/05/2023.
//

import UIKit
import SnapKit

protocol TopicViewDelegate: AnyObject{
    
}

class TopicViewController: UIViewController {
    
    var presenter: TopicPresenterDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension TopicViewController: TopicViewDelegate{
    
    
}
