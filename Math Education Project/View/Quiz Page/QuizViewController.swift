//
//  QuizViewController.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 18/04/2023.
//

import UIKit
import SnapKit

protocol QuizViewDelegate: AnyObject{
    func getQuizez(quizes: Quiz)
}

class QuizViewController: UIViewController {
    
    var presenter: QuizPresenterDelegate!
    
    var quizez = Dynamic(Quiz(id: Int(), title: String(), topic: Int(), questions: []))
    
    private lazy var questionsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionV.register(CustomCollectionCell.self, forCellWithReuseIdentifier: CustomCollectionCell.identifier)
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.isPagingEnabled = true
        collectionV.showsHorizontalScrollIndicator = false
        collectionV.isScrollEnabled = false
        return collectionV
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "greaterthan.square.fill"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.tintColor = .black
        button.addTarget(self, action: #selector(nextButtonDidSelected), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        view.backgroundColor = .white
        
        view.addSubview(questionsCollection)
        questionsCollection.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.bottom.equalTo(-130)
        }
        
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.width.height.equalTo(45)
            make.trailing.equalTo(-24)
            make.top.equalTo(questionsCollection.snp.bottom).offset(20)
        }
    }
    
    var currentIndex = 0
    @objc func nextButtonDidSelected(){
        currentIndex += 1
        
        let questions = self.quizez.value.questions
        
        // Calculate the new index path for the cell by moving it to the end of the collection view
        let newIndexPath = IndexPath(row: currentIndex, section: 0)
        
        
        // Move the cell from the current index path to the new index path
        questionsCollection.scrollToItem(at: newIndexPath, at: .centeredHorizontally, animated: true)
    }
}

extension QuizViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.quizez.value.questions.first?.answers.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let colors = [UIColor.green, UIColor.black, UIColor.red, UIColor.orange, UIColor.white]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionCell.identifier, for: indexPath) as? CustomCollectionCell else { return CustomCollectionCell()}
        cell.backgroundColor = colors[indexPath.row]
        let questionsData = self.quizez.value.questions[indexPath.row].answers[indexPath.row].text
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: questionsCollection.frame.width, height: questionsCollection.frame.height - 10)
    }
}


extension QuizViewController: QuizViewDelegate{
    func getQuizez(quizes: Quiz){
        self.quizez.value = quizes
        bind()
    }
}


extension QuizViewController{
    func bind(){
        presenter.viewDidLoad()
        self.quizez.bind { _ in
            self.questionsCollection.reloadData()
        }
    }
}
