//
//  ViewController.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 16/04/2023.
//

import UIKit
import SnapKit

protocol HomeViewDelegate: AnyObject{
    
}

class HomeViewController: UIViewController {
    
    private lazy var contentSize = CGSize(width: view.frame.width, height: view.frame.height + 1600)
    
    private lazy var scrollV: UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.contentSize = contentSize
        scrollV.frame = view.bounds
        scrollV.contentInsetAdjustmentBehavior = .never
        return scrollV
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.frame.size = contentSize
        view.backgroundColor = .white
        return view
    }()
    
    var presenter: HomePresenterDelegate!
    
    private lazy var navigationParentView: UIView = {
        let view = UIView()
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
        
        return view
    }()
    
    private lazy var logoImage: UIImageView = {
        let imageV = UIImageView()
        imageV.backgroundColor = .white
        return imageV
    }()
    
    private lazy var burgerMenu: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        button.tintColor = .white
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        return button
    }()
    
    private lazy var gradientView: GradientView = {
        let gradientV = GradientView(gradientStartColor: UIColor(red: 18/255, green: 77/255, blue: 193/255, alpha: 0.67), gradientEndColor: UIColor(red: 0/255, green: 20/255, blue: 58/255, alpha: 0.38))
        return gradientV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.backgroundColor = .white
        view.addSubview(scrollV)
        scrollV.addSubview(contentView)
        
        contentView.addSubview(navigationParentView)
        navigationParentView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(33)
            make.height.equalTo(63)
        }
        
        navigationParentView.addSubview(gradientView)
        gradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        gradientView.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.leading.equalTo(26)
            make.centerY.equalToSuperview()
            make.height.equalTo(48)
            make.width.equalTo(25)
        }
        
        gradientView.addSubview(burgerMenu)
        burgerMenu.snp.makeConstraints { make in
            make.trailing.equalTo(-21)
            make.centerY.equalToSuperview()
            make.height.equalTo(29)
            make.width.equalTo(23)
        }
        
        
        
    }
    
}


extension HomeViewController: HomeViewDelegate{
    
    
}
