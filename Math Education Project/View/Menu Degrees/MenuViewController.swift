//
//  MenuViewController.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 17/04/2023.
//

import UIKit
import SnapKit

protocol MenuViewDelegate: AnyObject{
    
    
}

class MenuViewController: UIViewController {
    
    var presenter: MenuPresenterDelegate!

    private lazy var parentView: GradientView = {
        let view = GradientView(gradientStartColor: UIColor(red: 18/255, green: 77/255, blue: 193/255, alpha: 0.67),
                                gradientEndColor: UIColor(red: 0/255, green: 20/255, blue: 58/255, alpha: 0.38))
        return view
    }()
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        return image
    }()
    
    private lazy var exitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(exitTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var degreeParent: UIView = {
        let view = UIView()
        return view
    }()
    
    
    private lazy var degreeOne: UILabel = {
        let label = UILabel()
        label.text = "1 класс"
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .bold)
        
        let tap = TaggedTapGestureRecognizer(target: self, action: #selector(degreeTapped))
        label.isUserInteractionEnabled = true
        tap.tag = 9
        label.addGestureRecognizer(tap)
        return label
    }()
    
    private lazy var degreeTwo: UILabel = {
        let label = UILabel()
        label.text = "2 класс"
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .bold)
        
        let tap = TaggedTapGestureRecognizer(target: self, action: #selector(degreeTapped(tapped:)))
        label.isUserInteractionEnabled = true
        tap.tag = 11
        label.addGestureRecognizer(tap)
        return label
    }()
    
    private lazy var degreeThree: UILabel = {
        let label = UILabel()
        label.text = "3 класс"
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .bold)
        
        let tap = TaggedTapGestureRecognizer(target: self, action: #selector(degreeTapped(tapped:)))
        tap.tag = 12
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        return label
    }()
    
    private lazy var degreeFour: UILabel = {
        let label = UILabel()
        label.text = "4 класс"
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .bold)
        
        let tap = TaggedTapGestureRecognizer(target: self, action: #selector(degreeTapped(tapped:)))
        tap.tag = 13
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        return label
    }()
    
    private lazy var degreeFive: UILabel = {
        let label = UILabel()
        label.text = "5 класс"
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .bold)
        
        let tap = TaggedTapGestureRecognizer(target: self, action: #selector(degreeTapped(tapped:)))
        tap.tag = 14
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        return label
    }()
    
    private lazy var degreeSix: UILabel = {
        let label = UILabel()
        label.text = "6 класс"
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .bold)
        
        let tap = TaggedTapGestureRecognizer(target: self, action: #selector(degreeTapped(tapped:)))
        tap.tag = 15
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        view.backgroundColor = .black
        
        view.addSubview(parentView)
        parentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        parentView.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.leading.equalTo(25)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(19)
            make.height.width.equalTo(50)
        }
        
        parentView.addSubview(exitButton)
        exitButton.snp.makeConstraints { make in
            make.trailing.equalTo(-23)
            make.centerY.equalTo(logoImage)
            make.height.width.equalTo(28)
        }
        
        parentView.addSubview(degreeParent)
        degreeParent.snp.makeConstraints { make in
            make.leading.equalTo(114)
            make.trailing.equalTo(-115)
            make.top.equalTo(exitButton.snp.bottom).offset(37)
            make.height.equalTo(400)
        }
        
        degreeParent.addSubview(degreeOne)
        degreeOne.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
        }
        
        degreeParent.addSubview(degreeTwo)
        degreeTwo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(degreeOne.snp.bottom).offset(20)
        }
        
        degreeParent.addSubview(degreeThree)
        degreeThree.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(degreeTwo.snp.bottom).offset(20)
        }
        
        degreeParent.addSubview(degreeFour)
        degreeFour.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(degreeThree.snp.bottom).offset(20)
        }
        
        degreeParent.addSubview(degreeFive)
        degreeFive.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(degreeFour.snp.bottom).offset(20)
        }
        
        degreeParent.addSubview(degreeSix)
        degreeSix.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(degreeFive.snp.bottom).offset(20)
        }
    }
    
    @objc func exitTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func degreeTapped(tapped: TaggedTapGestureRecognizer){
        switch tapped.tag{
        case 9:
            presenter.getCourseId(id: 9)
        case 11:
            presenter.getCourseId(id: 11)
        case 12:
            presenter.getCourseId(id: 12)
        case 13:
            presenter.getCourseId(id: 13)
        case 14:
            presenter.getCourseId(id: 14)
        case 15:
            presenter.getCourseId(id: 15)
        default:
            break
        }
        self.dismiss(animated: true)
    }
}

extension MenuViewController: MenuViewDelegate{
    
}
