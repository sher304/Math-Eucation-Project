//
//  QuizViewController.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 18/04/2023.
//

import UIKit
import SnapKit

protocol QuizViewDelegate: AnyObject{
    
}

class QuizViewController: UIViewController {
    
    var presenter: QuizPresenterDelegate!
    
    private lazy var quizTitle: UILabel = {
        let label = UILabel()
        label.text = "Quiz 1"
        label.textColor = .black
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private lazy var question: UILabel = {
        let label = UILabel()
        label.text = "1 + 1, is equal to?"
        label.font = .systemFont(ofSize: 20, weight: .black)
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
        return button
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
}

extension QuizViewController: QuizViewDelegate{
    
}
