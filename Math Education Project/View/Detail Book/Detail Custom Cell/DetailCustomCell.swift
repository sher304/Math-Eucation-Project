//
//  DetailCustomCell.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 17/04/2023.
//

import UIKit
import SnapKit

protocol DetailCellDelegate {
    func didTapped(id: Int)
}


class DetailCustomCell: UITableViewCell{
    
    static let identifier = "CustomCell"
    
    var delegate: DetailCellDelegate!
    
    var unit = Dynamic(Units())
    
    private lazy var coursesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionV.register(DetailCollectionCell.self, forCellWithReuseIdentifier: DetailCollectionCell.identifier)
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.showsHorizontalScrollIndicator = false
        collectionV.isScrollEnabled = false
        return collectionV
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    
    public func fillData(unit: [Unit], delegate: DetailCellDelegate){
        self.unit.value = unit
        self.delegate = delegate
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
        return self.unit.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionCell.identifier, for: indexPath) as?
                DetailCollectionCell else { return DetailCollectionCell()}
        let colors = [UIColor(red: 219/255, green: 76/255, blue: 64/266, alpha: 1),
                      UIColor(red: 76/2, green: 61/255, blue: 61/255, alpha: 1),
                      UIColor(red: 85/2, green: 61/255, blue: 54/255, alpha: 1),
                      UIColor(red: 139/255, green: 30/255, blue: 63/255, alpha: 1),
                      UIColor(red: 18/255, green: 41/255, blue: 50/255, alpha: 1),
                      UIColor(red: 44/255, green: 81/255, blue: 76/255, alpha: 1),
                      UIColor(red: 44/255, green: 81/255, blue: 76/255, alpha: 1),
                      UIColor(red: 219/255, green: 76/255, blue: 64/266, alpha: 1),
                      UIColor(red: 18/255, green: 41/255, blue: 50/255, alpha: 1),
                      UIColor(red: 76/2, green: 61/255, blue: 61/255, alpha: 1),
                      UIColor(red: 139/255, green: 30/255, blue: 63/255, alpha: 1),
                      UIColor(red: 18/255, green: 41/255, blue: 50/255, alpha: 1),
        ]
        
        let data = self.unit.value[indexPath.row]
        cell.fillData(title: data.title, backgroundColor: colors[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 183, height: 111)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = self.unit.value[indexPath.row]
        delegate.didTapped(id: data.id)
    }
}

