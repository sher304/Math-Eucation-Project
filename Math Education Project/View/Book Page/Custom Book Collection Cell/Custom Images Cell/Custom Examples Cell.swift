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
    
    private lazy var examplePhoto: UIImageView = {
        let imageV = UIImageView()
        imageV.backgroundColor = .red
        return imageV
    }()
    
    
    override func layoutSubviews(){
        super.layoutSubviews()
        contentView.addSubview(examplePhoto)
        examplePhoto.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    public func setExmapleImage(image: String){
        examplePhoto.kf.setImage(with: URL(string: image))
    }
}
