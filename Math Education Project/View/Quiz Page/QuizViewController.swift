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
    func answerDidSelected(id: Int)
}

class QuizViewController: UIViewController {
    
    var presenter: QuizPresenterDelegate!
    
    var quizez = Dynamic(Quiz(id: Int(), title: String(), topic: Int(), questions: []))
    
    var filtredData: [Answer] = []
    
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
    
    var currentIndex = 0
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
    }
}

extension QuizViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.quizez.value.questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionCell.identifier, for: indexPath) as? CustomCollectionCell else { return CustomCollectionCell()}
        let answersData = self.quizez.value.questions[indexPath.row].answers
        let questions = self.quizez.value.questions[indexPath.row].text
        
        cell.fillData(question: questions, answers: answersData, delegate: self)
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
    
    
    func answerDidSelected(id: Int){
        DispatchQueue.main.async { [self] in
            filterAnswers(id: id)
            if currentIndex == self.quizez.value.questions.count - 1{
                navigationController?.pushViewController(ResultDependensy.build(), animated: true)
            }else{
                currentIndex += 1
                let newIndexPath = IndexPath(row: currentIndex, section: 0)
                questionsCollection.scrollToItem(at: newIndexPath, at: .centeredHorizontally, animated: true)
                questionsCollection.panGestureRecognizer.reset()
            }
        }
    }
    
    func filterAnswers(id: Int){
        //        let correct = self.quizez.value.questions.compactMap({$0.answers.first(where: {$0.isCorrect == true && $0.id == id})})
        
        let correct = self.quizez.value.questions.compactMap({$0.answers.first(where: {$0.id == id})})
        
        for counter in 0...self.filtredData.count {
            if counter == self.filtredData.count{
                correct.forEach { answer in
                    self.filtredData.append(answer)
                }
            }
        }
        
        if self.filtredData.count == self.quizez.value.questions.count{
            presenter.getAnswerId(answers: self.filtredData)
        }
    }
}
