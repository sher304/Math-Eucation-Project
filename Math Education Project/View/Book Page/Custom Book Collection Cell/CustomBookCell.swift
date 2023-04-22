//
//  CustomBookCell.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 23/04/2023.
//

import UIKit
import SnapKit

class CustomBookCell: UICollectionViewCell{
    
    static let identifier = "CustomCell"
    
    private lazy var topParentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.backward.circle"), for: .normal)
        button.tintColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        return button
    }()
    
    private lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.text = "Название темы"
        label.textColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        label.font = .systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCostraints()
    }
    
    private func setupCostraints(){

        contentView.addSubview(topParentView)
        topParentView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(137)
        }
        
        topParentView.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(20)
            make.height.width.equalTo(37)
        }
        
        topParentView.addSubview(headerTitle)
        headerTitle.snp.makeConstraints { make in
            make.leading.equalTo(backButton.snp.trailing).offset(8)
            make.centerY.equalTo(backButton)
        }
    }
}
