//
//  DetailViewController.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 17/04/2023.
//

import UIKit
import SnapKit

protocol DetailViewDelegate: AnyObject{
    func fetchTopics(unit: [Unit])
}


class DetailViewController: UIViewController {
    
    var presenter: DetailPresenter!
    
    var unit = Dynamic([Unit]())
    
    private lazy var contentSize = CGSize(width: view.frame.width, height: view.frame.height + 320)
    
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
        imageV.contentMode = .center
        imageV.tintColor = .white
        imageV.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(logoDidTapped))
        imageV.addGestureRecognizer(tap)
        return imageV
    }()
    
    private lazy var burgerMenu: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        button.tintColor = .white
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.addTarget(self, action: #selector(burgerDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var mathTitle: UILabel = {
        let label = UILabel()
        label.text = "Математика"
        label.font = .systemFont(ofSize: 48, weight: .bold)
        label.textColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        return label
    }()
    
    
    private lazy var degreeTitle: UILabel = {
        let label = UILabel()
        label.text = "1 класс"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        return label
    }()
    
    private lazy var aboutCourse: UILabel = {
        let label = UILabel()
        label.text = "Об курсе"
        label.font = .systemFont(ofSize: 48, weight: .bold)
        label.textColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        return label
    }()
    
    private lazy var coursesTable: UITableView = {
        let table = UITableView()
        table.register(DetailCustomCell.self, forCellReuseIdentifier: DetailCustomCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.isScrollEnabled = false
        table.showsHorizontalScrollIndicator = false
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enableBackSwipe()
        presenter.viewDidLoad()
        setupConstraints()
        
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
        
        gradientView.addSubview(burgerMenu)
        burgerMenu.snp.makeConstraints { make in
            make.trailing.equalTo(-21)
            make.centerY.equalToSuperview()
            make.height.equalTo(22)
            make.width.equalTo(29)
        }
        
        contentView.addSubview(mathTitle)
        mathTitle.snp.makeConstraints { make in
            make.leading.equalTo(25)
            make.top.equalTo(navigationParentView.snp.bottom).offset(38)
        }
        
        
        contentView.addSubview(aboutCourse)
        aboutCourse.snp.makeConstraints { make in
            make.leading.equalTo(mathTitle)
            make.top.equalTo(mathTitle.snp.bottom).offset(33)
        }
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(aboutCourse)
            make.top.equalTo(aboutCourse.snp.bottom)
        }
        
        contentView.addSubview(coursesTable)
        coursesTable.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(descriptionLabel.snp.bottom).offset(80)
        }
    }
    
    func enableBackSwipe(){
        let backSwipeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleBackSwipe(_:)))
        backSwipeGesture.edges = .left
        self.view.addGestureRecognizer(backSwipeGesture)
    }

    @objc func handleBackSwipe(_ gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        if gestureRecognizer.state == .recognized {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func burgerDidTapped(){
        navigationController?.pushViewController(MenuDependensy.build(), animated: true)
    }
    
    
    @objc func logoDidTapped(){
        navigationController?.popViewController(animated: true)
    }
}


extension DetailViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DetailCustomCell()
        cell.fillData(unit: self.unit.value, delegate: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 720
    }
    
}

extension DetailViewController: DetailViewDelegate{
    func fetchTopics(unit: [Unit]){
        DispatchQueue.main.async {
            self.unit.value = unit
            self.coursesTable.reloadData()
        }
    }
}

extension DetailViewController: DetailCellDelegate{
    func didTapped(id: Int) {
        self.navigationController?.pushViewController(BookDependensy.build(), animated: true)
        presenter.getById(id: id)
    }
}

