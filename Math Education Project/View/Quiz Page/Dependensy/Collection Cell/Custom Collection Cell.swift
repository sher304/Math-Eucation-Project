//
//  Custom Collection Cell.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 21/04/2023.
//

import UIKit
import SnapKit

class CustomCollectionCell: UICollectionViewCell{
    
    static let identifier = "CustomCell"
    
    private lazy var buttonTest: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        button.setTitle("WWW", for: .normal)
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()

        setupConstraints()
        
    }
    
    private func setupConstraints(){
        contentView.addSubview(buttonTest)
        buttonTest.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(30)
        }
    }
    
    @objc func didTappedButton(){
        print("Tapped")
    }
    
}
