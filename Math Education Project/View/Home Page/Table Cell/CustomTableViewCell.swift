//
//  TableViewCell.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 16/04/2023.
//

import UIKit
import Kingfisher
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    private lazy var parentView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .orange
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var degreeLabel: UILabel = {
        let label = UILabel()
        label.text = "1 класс"
        label.textColor = .white
        label.font = .systemFont(ofSize: 36, weight: .bold)
        return label
    }()
    
    private lazy var mathLabel: UILabel = {
        let label = UILabel()
        label.text = "Математика"
        label.textColor = .white
        label.font = .systemFont(ofSize: 48, weight: .bold)
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()

    }
    
    public func fillData(title: String, image: UIColor){
        DispatchQueue.main.async {
            self.degreeLabel.text = title.replacingOccurrences(of: "Математика", with: "").trimmingCharacters(in: .whitespaces)
            self.parentView.backgroundColor = image
        }
    }
    
    private func setupConstraints(){
        
        contentView.addSubview(parentView)
        parentView.snp.makeConstraints { make in
            make.leading.equalTo(21)
            make.trailing.equalTo(-21)
            make.bottom.equalToSuperview().offset(-15)
            make.top.equalToSuperview()
        }
        
        parentView.addSubview(degreeLabel)
        degreeLabel.snp.makeConstraints { make in
            make.leading.equalTo(21)
            make.top.equalTo(60)
        }
        
        parentView.addSubview(mathLabel)
        mathLabel.snp.makeConstraints { make in
            make.leading.equalTo(21)
            make.top.equalTo(degreeLabel.snp.bottom).offset(7.2)
            make.trailing.equalTo(-5)
        }
    }
}
