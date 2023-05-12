//
//  Custom Examples Cell.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 10/05/2023.
//

import Foundation
import Kingfisher
import SnapKit

class CustomExamplesCell: UICollectionViewCell{
    
    
    static let identifier = "CustomExampleCell"
    
    private lazy var parentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var exampleText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        return label
    }()
    
    private lazy var examplePhoto: UIImageView = {
        let imageV = UIImageView()
        imageV.layer.cornerRadius = 15
        imageV.layer.masksToBounds = true
        imageV.contentMode = .scaleAspectFit
        imageV.isHidden = true
        return imageV
    }()
    
    
    override func layoutSubviews(){
        super.layoutSubviews()
        contentView.addSubview(parentView)
        parentView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(15)
            make.bottom.equalTo(-5)
        }
        
        parentView.addSubview(exampleText)
        exampleText.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalTo(-5)
            make.top.equalToSuperview()
        }
        
        parentView.addSubview(examplePhoto)
        examplePhoto.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(exampleText.snp.bottom).offset(10)
        }
    }
    
    public func setExmapleImage(image: String, text: String){
        exampleText.text = text
        print(image)
        if image != ""{
            examplePhoto.kf.setImage(with: URL(string: image))
        }else{
            self.examplePhoto.isHidden = true
        }
    }
}
