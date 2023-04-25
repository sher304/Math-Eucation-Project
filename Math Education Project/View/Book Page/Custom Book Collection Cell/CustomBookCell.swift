//
//  CustomBookCell.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 23/04/2023.
//

import UIKit
import Kingfisher
import SnapKit


class CustomBookCell: UICollectionViewCell{
    
    static let identifier = "CustomCell"
    
    var delegate: BookCellDelegate!
    
    private lazy var topParentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.backgroundColor = .systemGray4
        view.addBottomShadow()
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.backward.circle"), for: .normal)
        button.tintColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.addTarget(self, action: #selector(backDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.text = "Название темы"
        label.textColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Математика | 1 класс | Глава 2"
        label.textColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var theoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Теория"
        label.textColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var descirptionTheoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание "
        label.textColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var mainImage: UIImageView = {
        let imageV = UIImageView()
        imageV.backgroundColor = .systemGray4
        imageV.layer.cornerRadius = 15
        imageV.layer.masksToBounds = true
        return imageV
    }()
    
    private lazy var expampleLabel: UILabel = {
        let label = UILabel()
        label.text = "Пример"
        label.textColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var descirptionExampleLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание "
        label.textColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var imagesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionV.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CustomImagesCell")
        collectionV.delegate = self
        collectionV.dataSource = self
        return collectionV
    }()
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCostraints()
    }
    
    public func fillData(title: String, theory: String,
                         descirption: String, mainImage: String, otherImages: String, delegate: BookCellDelegate){
        self.delegate = delegate
        DispatchQueue.main.async {
            self.headerTitle.text = title
            self.descriptionLabel.text = descirption
            
            self.theoryLabel.text = theory
            self.descirptionTheoryLabel.text = descirption
            
            self.expampleLabel.text = theory
            self.descirptionExampleLabel.text = descirption
            self.mainImage.kf.setImage(with: URL(string: mainImage))
        }
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
            make.trailing.equalTo(-10)
            make.centerY.equalTo(backButton)
            make.height.equalTo(40)
        }
        
        topParentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headerTitle.snp.bottom).offset(9)
        }
        
        contentView.addSubview(theoryLabel)
        theoryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(topParentView.snp.bottom).offset(33)
        }
        
        contentView.addSubview(descirptionTheoryLabel)
        descirptionTheoryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(theoryLabel.snp.bottom).offset(5)
        }
        
        contentView.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.leading.equalTo(21)
            make.trailing.equalTo(-22)
            make.top.equalTo(descirptionTheoryLabel.snp.bottom).offset(54)
            make.height.equalTo(152)
        }
        
        contentView.addSubview(expampleLabel)
        expampleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainImage.snp.bottom).offset(12)
        }
        
        contentView.addSubview(descirptionExampleLabel)
        descirptionExampleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(expampleLabel.snp.bottom).offset(5)
        }
        
        contentView.addSubview(imagesCollection)
        imagesCollection.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.bottom.equalToSuperview()
            make.top.equalTo(descirptionExampleLabel.snp.bottom).offset(54)
        }
    }
    
    @objc func backDidTapped(){
        delegate.backDidTapped()
    }
}

extension CustomBookCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomImagesCell", for: indexPath)
        
        cell.backgroundColor = .orange
        cell.layer.cornerRadius = 14
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 84)
    }
    
}
