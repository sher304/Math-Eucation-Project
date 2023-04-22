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
    
    var topics = Dynamic(Topics())
    
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
    
    
    public func fillData(topics: Topics){
        self.topics.value = topics
        self.coursesCollection.reloadData()
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
        return self.topics.value.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionCell.identifier, for: indexPath) as? 
                DetailCollectionCell else { return DetailCollectionCell()}
        let data = self.topics.value
        cell.fillData(title: data[indexPath.row].title, text: data[indexPath.row].text)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 183, height: 111)
    }
    
    
}
