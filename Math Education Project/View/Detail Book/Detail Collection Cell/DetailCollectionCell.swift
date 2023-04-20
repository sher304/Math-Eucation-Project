//
//  DetailCollectionCell.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 17/04/2023.
//

import UIKit
import SnapKit

class DetailCollectionCell: UICollectionViewCell{
    
    static let identifier = "CustomCollectionCell"

    private lazy var parentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var chapterLabel: UILabel = {
        let label = UILabel()
        label.text = "Глава 1"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Название"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        contentView.addSubview(parentView)
        parentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        parentView.addSubview(chapterLabel)
        chapterLabel.snp.makeConstraints { make in
            make.leading.equalTo(9)
            make.top.equalTo(28)
        }
        
        parentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(chapterLabel)
            make.top.equalTo(chapterLabel.snp.bottom)
        }
    }
}
