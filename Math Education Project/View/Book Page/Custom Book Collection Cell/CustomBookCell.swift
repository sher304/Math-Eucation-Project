//
//  CustomBookCell.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 23/04/2023.
//

import UIKit
import Kingfisher
import RxCocoa
import RxSwift
import SnapKit


class CustomBookCell: UICollectionViewCell{
    
    static let identifier = "CustomCell"
    
    let disposeBag = DisposeBag()
    
    var delegate: BookCellDelegate!
    var exmaplesData = Dynamic([Example]())
    
    var exampleDataRx = BehaviorSubject<[Example]>(value: [Example]())
    
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
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        return label
    }()
    
    private lazy var theoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Теория"
        label.textColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
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
        label.text = "Мисалы"
        label.textColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var imagesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionV.register(CustomExamplesCell.self, forCellWithReuseIdentifier: CustomExamplesCell.identifier)
        //        collectionV.delegate = self
        //        collectionV.dataSource = self
        //        collectionV.isScrollEnabled = false
        return collectionV
    }()
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCostraints()
        initCollection()
        
    }
    
    public func fillData(title: String, theory: String, mainImage: String?,
                         example: [Example], delegate: BookCellDelegate){
        self.delegate = delegate
        DispatchQueue.main.async {
            //            self.exmaplesData.value = example
            self.exampleDataRx.onNext(example)
            self.headerTitle.text = title
            self.theoryLabel.text = theory
            self.mainImage.kf.setImage(with: URL(string: mainImage ?? ""))
            self.imagesCollection.reloadData()
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
            make.leading.equalTo(10)
            make.height.width.equalTo(37)
            make.top.equalToSuperview()
        }
        
        topParentView.addSubview(headerTitle)
        headerTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-5)
            make.trailing.equalTo(-15)
        }
        
        contentView.addSubview(theoryLabel)
        theoryLabel.snp.makeConstraints { make in
            make.top.equalTo(topParentView.snp.bottom).offset(33)
            make.width.equalTo(contentView.frame.width - 20)
            make.centerX.equalToSuperview()
        }
        
        
        contentView.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.leading.equalTo(21)
            make.trailing.equalTo(-22)
            make.top.equalTo(theoryLabel.snp.bottom).offset(54)
            make.height.equalTo(152)
        }
        
        contentView.addSubview(expampleLabel)
        expampleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainImage.snp.bottom).offset(12)
        }
        
        contentView.addSubview(imagesCollection)
        imagesCollection.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.bottom.equalToSuperview()
            make.top.equalTo(expampleLabel.snp.bottom).offset(54)
        }
    }
    
    
    @objc func backDidTapped(){
        delegate.backDidTapped()
    }
}

extension CustomBookCell: UICollectionViewDelegateFlowLayout {
    
    //    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //        return self.exmaplesData.value.count
    //    }
    //
    //    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomExamplesCell.identifier, for: indexPath) as? CustomExamplesCell else { return CustomExamplesCell()}
    //        let data = self.exmaplesData.value[indexPath.row]
    //        print("")
    //        print("")
    //        print("")
    //        print("")
    //        print(data.examplePhotos, "MAIN IMAGE")
    //        print(data)
    //        print("")
    //        print("")
    //        print("")
    //        print("")
    //        print("")
    //        if indexPath.row < data.examplePhotos.count{
    //            cell.setExmapleImage(image: data.examplePhotos[indexPath.row].photo,
    //                                 text: data.exampleNumbers[indexPath.row].text )
    //        }else{
    //            cell.setExmapleImage(image: "", text: data.exampleNumbers[indexPath.row].text)
    //        }
    //        return cell
    //    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.contentView.frame.width - 20, height: 290)
    }
}


extension CustomBookCell{
    
    private func initCollection(){
        
        self.imagesCollection.rx.setDelegate(self)
        
        var topicSubscriber: Observable<[Example]>{
            return self.exampleDataRx.asObservable()
        }

        topicSubscriber.bind(to: self.imagesCollection.rx.items(cellIdentifier: CustomExamplesCell.identifier, cellType: CustomExamplesCell.self)) {indexPath, model, cell in
            if model.examplePhotos.count > indexPath {
                cell.setExmapleImage(image: model.examplePhotos[indexPath].photo, text: model.exampleNumbers[indexPath].text)
            }else{
                cell.setExmapleImage(image: "moIMAGE", text: model.exampleNumbers[indexPath].text)
            }
        }.disposed(by: disposeBag)
    }
    
}
