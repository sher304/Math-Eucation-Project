//
//  BookViewController.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 22/04/2023.
//

import UIKit
import SnapKit

protocol BookViewDelegate: AnyObject{
    func getTopic(topic: [SingleTopic])
    
}

protocol BookCellDelegate {
    func backDidTapped()
}

class BookViewController: UIViewController {
    
    var topic = Dynamic([SingleTopic]())
    
    var presenter: BookPresenterDelegate!
    
    private lazy var contentSize = CGSize(width: view.frame.width, height: view.frame.height * 15)
    
    private lazy var scrollV: UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.contentSize = contentSize
        scrollV.frame = self.view.bounds
        scrollV.contentInsetAdjustmentBehavior = .never
        return scrollV
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.frame.size = contentSize
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var navigationParentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var gradientView: GradientView = {
        let gradientV = GradientView(gradientStartColor: UIColor(red: 18/255, green: 77/255, blue: 193/255, alpha: 0.67), gradientEndColor: UIColor(red: 0/255, green: 20/255, blue: 58/255, alpha: 0.38))
        return gradientV
    }()
    
    private lazy var logoImage: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(systemName: "homekit")
        imageV.tintColor = .white
        imageV.contentMode = .center
        imageV.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(logoDidTapped))
        imageV.addGestureRecognizer(tap)
        return imageV
    }()
    
    private lazy var quizIcon: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "q.circle"), for: .normal)
        button.tintColor = .white
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(quizDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var bookCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionV.register(CustomBookCell.self, forCellWithReuseIdentifier: CustomBookCell.identifier)
        collectionV.isPagingEnabled = true
        collectionV.isScrollEnabled = false
        collectionV.showsHorizontalScrollIndicator = false
        collectionV.delegate = self
        collectionV.dataSource = self
        return collectionV
    }()
    
    
    private lazy var bottomParentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.backgroundColor = .white
        view.addTopShadow()
        
        return view
    }()
    
    private lazy var previusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Предыдущий ", for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 4/255, green: 31/255, blue: 82/255, alpha: 1)
        button.layer.cornerRadius = 14
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        return button
    }()
    
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Следующий ", for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 4/255, green: 31/255, blue: 82/255, alpha: 1)
        button.layer.cornerRadius = 14
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupConstraints()
        enableBackSwipe()
        
    }
    
    private func setupConstraints(){
        view.addSubview(scrollV)
        scrollV.addSubview(contentView)
        
        contentView.addSubview(navigationParentView)
        navigationParentView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(55)
            make.height.equalTo(63)
        }
        
        navigationParentView.addSubview(gradientView)
        gradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        gradientView.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.leading.equalTo(26)
            make.centerY.equalToSuperview()
            make.height.equalTo(48)
            make.width.equalTo(25)
        }
        
        gradientView.addSubview(quizIcon)
        quizIcon.snp.makeConstraints { make in
            make.trailing.equalTo(-21)
            make.centerY.equalToSuperview()
            make.height.equalTo(22)
            make.width.equalTo(29)
        }
        
        contentView.addSubview(bookCollection)
        bookCollection.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(quizIcon.snp.bottom).offset(15)
        }
        
        view.addSubview(bottomParentView)
        bottomParentView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(100)
            make.leading.trailing.equalToSuperview()
        }
        
        bottomParentView.addSubview(previusButton)
        previusButton.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(17)
            make.bottom.equalTo(-16)
            make.width.equalTo(167)
        }
        
        bottomParentView.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.leading.equalTo(previusButton.snp.trailing).offset(15)
            make.top.equalTo(17)
            make.bottom.equalTo(-16)
            make.width.equalTo(167)
        }
    }
    
    func enableBackSwipe() {
        let backSwipeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleBackSwipe(_:)))
        backSwipeGesture.edges = .left
        self.view.addGestureRecognizer(backSwipeGesture)
    }
    
    @objc func handleBackSwipe(_ gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        if gestureRecognizer.state == .recognized {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func logoDidTapped(){
        self.navigationController?.pushViewController(HomeDependensy.build(), animated: true)
    }
    
    @objc func quizDidTapped(){
        showAlert()
    }
    
    
    private func showAlert(){
        let alertController = UIAlertController(title: "ТЕСТ", message: "Сиз тест откунуз келеби.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ООБА", style: .default) { _ in
            // Handle OK button tap
            let quizId = self.topic.value.first?.quizes.first?.id
            self.presenter.getQuizId(id: quizId ?? 0)
            self.navigationController?.pushViewController(QuizDependensy.build(), animated: true)
        }
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "ЖОК", style: .cancel) { _ in
            // Handle cancel button tap
            print("Cancel button tapped")
        }
        alertController.addAction(cancelAction)
        
        // Present the alert
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}

extension BookViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.topic.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomBookCell.identifier, for: indexPath) as? CustomBookCell else { return CustomBookCell() }
        let data = self.topic.value[indexPath.row]
        cell.fillData(title: data.title, theory: data.text, mainImage: "mainPhotos", example: self.topic.value[indexPath.row].examples, delegate: self)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bookCollection.frame.width, height: bookCollection.frame.height - 15)
    }
    
    
}

extension BookViewController: BookViewDelegate{
    func getTopic(topic: [SingleTopic]){
        self.topic.value = topic
        if topic.first?.quizes.first?.id == nil{
            self.quizIcon.isHidden = true
        }
        self.bookCollection.reloadData()
    }
}


extension BookViewController: BookCellDelegate{
    func backDidTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
