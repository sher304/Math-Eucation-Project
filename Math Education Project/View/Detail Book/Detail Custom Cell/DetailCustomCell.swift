//
//  DetailCustomCell.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 17/04/2023.
//

import UIKit
import SnapKit


class DetailCustomCell: UITableViewCell{
    
    static let identifier = "CustomCell"
    
    private lazy var coursesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionV.register(DetailCollectionCell.self, forCellWithReuseIdentifier: DetailCollectionCell.identifier)
        collectionV.delegate = self
        collectionV.dataSource = self
        return collectionV
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    private func setupConstraints(){
        contentView.addSubview(coursesCollection)
        coursesCollection.snp.makeConstraints { make in
            make.bottom.top.equalToSuperview()
            make.leading.equalTo(8)
            make.trailing.equalTo(-8)
            
        }
    }
}

extension DetailCustomCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionCell.identifier, for: indexPath) as? DetailCollectionCell else { return DetailCollectionCell()}
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 183, height: 111)
    }
    
    
}
