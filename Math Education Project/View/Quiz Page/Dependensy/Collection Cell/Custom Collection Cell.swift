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
    
    private lazy var questionTitle: UILabel = {
        let label = UILabel()
        label.text = "Question"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .semibold)
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
    
    private lazy var answerThree: UIButton = {
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
    
    private lazy var answerFour: UIButton = {
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        contentView.addSubview(questionTitle)
        questionTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(40)
        }
        
        contentView.addSubview(answerOne)
        answerOne.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.centerY.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(120)
        }
        
        contentView.addSubview(answerTwo)
        answerTwo.snp.makeConstraints { make in
            make.leading.equalTo(answerOne)
            make.top.equalTo(answerOne.snp.bottom).offset(30)
            make.height.equalTo(60)
            make.width.equalTo(120)
        }
        
        contentView.addSubview(answerThree)
        answerThree.snp.makeConstraints { make in
            make.trailing.equalTo(-20)
            make.centerY.equalTo(answerOne)
            make.height.equalTo(60)
            make.width.equalTo(120)
        }
        
        contentView.addSubview(answerFour)
        answerFour.snp.makeConstraints { make in
            make.trailing.equalTo(answerThree)
            make.centerY.equalTo(answerTwo)
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
