//
//  Custom Collection Cell.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 21/04/2023.
//

import UIKit
import SnapKit

class CustomCollectionCell: UICollectionViewCell{
    
    static let identifier = "CustomCell"
    
    weak var delegate: QuizViewDelegate?
    
    private lazy var questionTitle: UILabel = {
        let label = UILabel()
        label.text = "Question"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var answerOne: UIButton = {
        var configure = UIButton.Configuration.filled()
        configure.title = "15"
        configure.buttonSize = .large
        configure.image = UIImage(systemName: "circle")
        configure.cornerStyle = .fixed
        configure.imagePadding = 15
        configure.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .large)
        configure.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
            var outcoming = incoming
            outcoming.font = .systemFont(ofSize: 14, weight: .semibold)
            return outcoming
        })
        
        let button = UIButton(configuration: configure)
        button.addTarget(self, action: #selector(answerDidSelected), for: .touchUpInside)
        return button
    }()
    
    private lazy var answerTwo: UIButton = {
        var configure = UIButton.Configuration.filled()
        configure.title = "15"
        configure.buttonSize = .large
        configure.image = UIImage(systemName: "circle")
        configure.cornerStyle = .fixed
        configure.imagePadding = 15
        configure.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .large)
        configure.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
            var outcoming = incoming
            outcoming.font = .systemFont(ofSize: 14, weight: .semibold)
            return outcoming
        })
        let button = UIButton(configuration: configure)
        button.addTarget(self, action: #selector(answerDidSelected), for: .touchUpInside)
        button.sizeToFit()
        return button
    }()
    
    private lazy var answerThree: UIButton = {
        var configure = UIButton.Configuration.filled()
        configure.title = "15"
        configure.buttonSize = .large
        configure.image = UIImage(systemName: "circle")
        configure.cornerStyle = .fixed
        configure.imagePadding = 15
        configure.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .large)
        configure.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
            var outcoming = incoming
            outcoming.font = .systemFont(ofSize: 14, weight: .semibold)
            return outcoming
        })
        
        let button = UIButton(configuration: configure)
        button.addTarget(self, action: #selector(answerDidSelected), for: .touchUpInside)
        button.sizeToFit()
        return button
    }()
    
    private lazy var answerFour: UIButton = {
        var configure = UIButton.Configuration.filled()
        configure.title = "15"
        configure.buttonSize = .large
        configure.image = UIImage(systemName: "circle")
        configure.cornerStyle = .fixed
        configure.imagePadding = 15
        configure.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .large)
        configure.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
            var outcoming = incoming
            outcoming.font = .systemFont(ofSize: 14, weight: .semibold)
            return outcoming
        })
        
        let button = UIButton(configuration: configure)
        button.addTarget(self, action: #selector(answerDidSelected), for: .touchUpInside)
        return button
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.answerOne.isEnabled = true
        self.answerOne.setImage(UIImage(systemName: "circle"), for: .normal)
        self.answerTwo.isEnabled = true
        self.answerTwo.setImage(UIImage(systemName: "circle"), for: .normal)
        self.answerThree.isEnabled = true
        self.answerThree.setImage(UIImage(systemName: "circle"), for: .normal)
        self.answerFour.isEnabled = true
        self.answerFour.setImage(UIImage(systemName: "circle"), for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
        
    }
    
    public func fillData(question: String, answers: [Answer], delegate: QuizViewDelegate){
        DispatchQueue.main.async {
            self.questionTitle.text = question
            self.answerOne.setTitle(answers[0].text, for: .normal)
            self.answerOne.tag = answers[0].id
            
            self.answerTwo.setTitle(answers[1].text, for: .normal)
            self.answerTwo.tag = answers[1].id
            
            self.answerThree.setTitle(answers[3].text, for: .normal)
            self.answerThree.tag = answers[3].id
            
            self.answerFour.setTitle(answers[2].text, for: .normal)
            self.answerFour.tag = answers[2].id
            
            self.delegate = delegate
        }
    }
    
    private func setupConstraints(){
        contentView.addSubview(questionTitle)
        questionTitle.snp.makeConstraints { make in
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(40)
        }
        
        contentView.addSubview(answerOne)
        answerOne.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.centerY.equalToSuperview()
            make.height.equalTo(90)
            make.width.equalTo(170)
        }
        
        contentView.addSubview(answerTwo)
        answerTwo.snp.makeConstraints { make in
            make.leading.equalTo(answerOne)
            make.top.equalTo(answerOne.snp.bottom).offset(30)
            make.height.equalTo(90)
            make.width.equalTo(170)
        }
        
        contentView.addSubview(answerThree)
        answerThree.snp.makeConstraints { make in
            make.trailing.equalTo(-20)
            make.centerY.equalTo(answerOne)
            make.height.equalTo(90)
            make.width.equalTo(170)
        }
        
        contentView.addSubview(answerFour)
        answerFour.snp.makeConstraints { make in
            make.trailing.equalTo(answerThree)
            make.centerY.equalTo(answerTwo)
            make.height.equalTo(90)
            make.width.equalTo(170)
        }
    }
    
    @objc func answerDidSelected(sender: UIButton){
        var c = 0
        sender.isSelected = !sender.isSelected
        if sender.isSelected{
            c += 1
            delegate?.answerDidSelected(id: sender.tag)
            sender.setImage(UIImage(systemName: "circle.circle.fill"), for: .normal)
            makeDisableEnable(sender: sender)
        }else{
            sender.setImage(UIImage(systemName: "circle"), for: .normal)
            makeDisableEnable(sender: sender)
        }
    }
}

extension CustomCollectionCell{
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
