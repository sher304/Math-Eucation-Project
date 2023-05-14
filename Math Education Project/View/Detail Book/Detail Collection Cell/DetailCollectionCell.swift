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
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
        
    }
    
    public func fillData(title: String, backgroundColor: UIColor){
        self.chapterLabel.text = title
        self.parentView.backgroundColor = backgroundColor
    }
    
    private func setupConstraints(){
        contentView.addSubview(parentView)
        parentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        parentView.addSubview(chapterLabel)
        chapterLabel.snp.makeConstraints { make in
            make.leading.equalTo(9)
            make.top.equalTo(5)
            make.trailing.equalTo(-5)
            make.bottom.equalTo(-5)
        }
    }
}
