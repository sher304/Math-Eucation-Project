//
//  ResultViewController.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 21/04/2023.
//

import UIKit
import SnapKit

protocol ResultViewDelegate: AnyObject{
    func getAnswersData(correct: Int, overall: Int)
    var answersResults: [Answer] {get set}
}

class ResultViewController: UIViewController {
    
    var presenter: ResultPresenterDelegate!
    
    var answersResults: [Answer] = []
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Result is 5/10"
        label.font = .systemFont(ofSize: 34, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var checkMarkImage: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(systemName: "checkmark.seal.fill")
        imageV.tintColor = .systemGreen
        return imageV
    }()
    
    private lazy var homeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Home", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 19
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(homeDidTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupConstraints()
        checkAnimation()
    }
    
    private func setupConstraints(){
        view.backgroundColor = .white
        
        view.addSubview(resultLabel)
        resultLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
        }
        
        view.addSubview(checkMarkImage)
        checkMarkImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(resultLabel.snp.bottom).offset(30)
            make.height.width.equalTo(160)
        }
        
        view.addSubview(homeButton)
        homeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(checkMarkImage.snp.bottom).offset(120)
            make.height.equalTo(50)
            make.leading.equalTo(70)
            make.trailing.equalTo(-70)
        }
    }
    
    func checkAnimation(){
        let positionY = checkMarkImage.frame.origin.y - 15
        let positionX = checkMarkImage.frame.origin.x
        let height = checkMarkImage.frame.height
        let width = checkMarkImage.frame.width
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseIn]) {
            self.checkMarkImage.frame = CGRect(x: positionX, y: positionY, width: width, height: height)
        } completion: { _ in }
    }
    
    @objc func homeDidTapped(){
        self.navigationController?.pushViewController(HomeDependensy.build(), animated: true)
    }
}

extension ResultViewController: ResultViewDelegate{
    func getAnswersData(correct: Int, overall: Int){
        DispatchQueue.main.async {
                self.resultLabel.text = "Result is \(correct) /\(overall)"
            }
    }
}

