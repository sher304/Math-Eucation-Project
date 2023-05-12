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
    
//    var unit = Dynamic([Unit]())
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
//        return self.unit.value.first?.topics.count ?? 0
        return self.unit.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionCell.identifier, for: indexPath) as? 
                DetailCollectionCell else { return DetailCollectionCell()}
//        let data = self.unit.value.first?.topics[indexPath.row]
        let data = self.unit.value[indexPath.row]
        cell.fillData(title: data.title )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 183, height: 111)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        delegate.didTapped(id: self.unit.value.first?.topics[indexPath.row].id ?? 0)
        delegate.didTapped(id: self.unit.value[indexPath.row].id)
    }
}

