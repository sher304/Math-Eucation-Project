//
//  QuizViewController.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 18/04/2023.
//

import UIKit
import SnapKit

protocol QuizViewDelegate: AnyObject{
    func getQuizData(quiz: Quiz)
}

class QuizViewController: UIViewController {
    
    var presenter: QuizPresenterDelegate!
    
    var questions = ["1 + 1 is equal to?", "5 + 5 is equal to?", "5 * 5 is?"]
    
    private lazy var quizTitle: UILabel = {
        let label = UILabel()
        label.text = "Quiz 1"
        label.textColor = .black
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        return label
    }()
    
    private lazy var question: UILabel = {
        let label = UILabel()
        label.text = "1 + 1 is equal to?"
        label.font = .systemFont(ofSize: 35, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private lazy var answerOne: UIButton = {
        var configure = UIButton.Configuration.filled()
        configure.title = "15"
        configure.buttonSize = .large
        configure.image = UIImage(systemName: "circle")
        configure.baseBackgroundColor = .orange
        configure.cornerStyle = .fixed
        configure.imagePadding = 15
        configure.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .large)
        configure.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
            var outcoming = incoming
            outcoming.font = .systemFont(ofSize: 22, weight: .semibold)
            return outcoming
        })
        
        let button = UIButton(configuration: configure)
        button.addTarget(self, action: #selector(answerDidSelected), for: .touchUpInside)
        return button
    }()
    
    private lazy var answerTwo: UIButton = {
        var configure = UIButton.Configuration.filled()
        configure.title = "16"
        configure.buttonSize = .large
        configure.image = UIImage(systemName: "circle")
        configure.baseBackgroundColor = .orange
        configure.cornerStyle = .fixed
        configure.imagePadding = 15
        configure.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .large)
        configure.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
            var outcoming = incoming
            outcoming.font = .systemFont(ofSize: 22, weight: .semibold)
            return outcoming
        })
        
        let button = UIButton(configuration: configure)
        button.addTarget(self, action: #selector(answerDidSelected), for: .touchUpInside)
        return button
    }()
    
    private lazy var answerThree: UIButton = {
        var configure = UIButton.Configuration.filled()
        configure.title = "16"
        configure.buttonSize = .large
        configure.image = UIImage(systemName: "circle")
        configure.baseBackgroundColor = .orange
        configure.cornerStyle = .fixed
        configure.imagePadding = 15
        configure.imagePlacement = .trailing
        configure.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .large)
        configure.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
            var outcoming = incoming
            outcoming.font = .systemFont(ofSize: 22, weight: .semibold)
            return outcoming
        })
        
        let button = UIButton(configuration: configure)
        button.addTarget(self, action: #selector(answerDidSelected), for: .touchUpInside)
        return button
    }()
    
    private lazy var answerFour: UIButton = {
        var configure = UIButton.Configuration.filled()
        configure.title = "16"
        configure.buttonSize = .large
        configure.image = UIImage(systemName: "circle")
        configure.baseBackgroundColor = .orange
        configure.cornerStyle = .fixed
        configure.imagePadding = 15
        configure.imagePlacement = .trailing
        configure.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .large)
        configure.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
            var outcoming = incoming
            outcoming.font = .systemFont(ofSize: 22, weight: .semibold)
            return outcoming
        })
        
        let button = UIButton(configuration: configure)
        button.addTarget(self, action: #selector(answerDidSelected), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableV: UITableView = {
        let tableV = UITableView()
        
        return tableV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupConstraints()
        
    }
    
    
    private func setupConstraints(){
        view.backgroundColor = .white
        
        view.addSubview(quizTitle)
        quizTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
        }
        
        view.addSubview(question)
        question.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(quizTitle.snp.bottom).offset(30)
        }
        
        view.addSubview(answerOne)
        answerOne.snp.makeConstraints { make in
            make.leading.equalTo(50)
            make.top.equalTo(question.snp.bottom).offset(150)
            make.height.equalTo(60)
            make.width.equalTo(120)
        }
        
        view.addSubview(answerTwo)
        answerTwo.snp.makeConstraints { make in
            make.leading.equalTo(answerOne)
            make.top.equalTo(answerOne.snp.bottom).offset(30)
            make.height.equalTo(60)
            make.width.equalTo(120)
        }
        
        view.addSubview(answerThree)
        answerThree.snp.makeConstraints { make in
            make.trailing.equalTo(-50)
            make.centerY.equalTo(answerOne)
            make.height.equalTo(60)
            make.width.equalTo(120)
        }
        
        view.addSubview(answerFour)
        answerFour.snp.makeConstraints { make in
            make.trailing.equalTo(answerThree)
            make.top.equalTo(answerThree.snp.bottom).offset(30)
            make.height.equalTo(60)
            make.width.equalTo(120)
        }
    }
    
    @objc func answerDidSelected(sender: UIButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected{
            sender.setImage(UIImage(systemName: "circle.circle.fill"), for: .normal)
            makeDisableEnable(sender: sender)
        }else{
            sender.setImage(UIImage(systemName: "circle"), for: .normal)
            makeDisableEnable(sender: sender)
        }
    }
}

extension QuizViewController{
    private func makeDisableEnable(sender: UIButton){
        if sender.isSelected{
            if sender == self.answerOne{
                self.answerTwo.isEnabled = false
                self.answerThree.isEnabled = false
                self.answerFour.isEnabled = false
            }else if sender == self.answerTwo {
                self.answerOne.isEnabled = false
                self.answerThree.isEnabled = false
                self.answerFour.isEnabled = false
            }else if sender == self.answerThree{
                self.answerOne.isEnabled = false
                self.answerTwo.isEnabled = false
                self.answerFour.isEnabled = false
            }else{
                self.answerOne.isEnabled = false
                self.answerTwo.isEnabled = false
                self.answerThree.isEnabled = false
            }
        }else{
            if sender == self.answerOne{
                self.answerTwo.isEnabled = true
                self.answerThree.isEnabled = true
                self.answerFour.isEnabled = true
            }else if sender == self.answerTwo {
                self.answerOne.isEnabled = true
                self.answerThree.isEnabled = true
                self.answerFour.isEnabled = true
            }else if sender == self.answerThree{
                self.answerOne.isEnabled = true
                self.answerTwo.isEnabled = true
                self.answerFour.isEnabled = true
            }else{
                self.answerOne.isEnabled = true
                self.answerTwo.isEnabled = true
                self.answerThree.isEnabled = true
            }
        }
    }
}

extension QuizViewController: QuizViewDelegate{
    func getQuizData(quiz: Quiz){
        self.question.text = quiz.questions.first?.text
        self.answerOne.setTitle(quiz.questions.map({$0.answers.map({$0.text})}).description, for: .normal)
        self.answerTwo.setTitle(quiz.questions.map({$0.answers.map({$0.text})}).description, for: .normal)
        self.answerThree.setTitle(quiz.questions.map({$0.answers.map({$0.text})}).description, for: .normal)
        self.answerFour.setTitle(quiz.questions.map({$0.answers.map({$0.text})}).description, for: .normal)
    }
}
