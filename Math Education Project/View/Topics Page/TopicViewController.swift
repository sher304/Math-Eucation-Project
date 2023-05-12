//
//  TopicViewController.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 12/05/2023.
//

import UIKit
import SnapKit

protocol TopicViewDelegate: AnyObject{
    func getTopics(topic: Topics)
}

class TopicViewController: UIViewController {
    
    var presenter: TopicPresenterDelegate!
    var topics = Dynamic(Topics())
    
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
        //        let tap = UITapGestureRecognizer(target: self, action: #selector(logoDidTapped))
        //        imageV.addGestureRecognizer(tap)
        return imageV
    }()
    
    private lazy var burgerMenu: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        button.tintColor = .white
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        //        button.addTarget(self, action: #selector(burgerDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableV = UITableView()
        tableV.delegate = self
        tableV.dataSource = self
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: "TopicTableCell")
        return tableV
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupCostraints()
        enableBackSwipe()
    }
    
    private func setupCostraints(){
        view.backgroundColor = .white
        
        view.addSubview(navigationParentView)
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
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(navigationParentView.snp.bottom)
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

extension TopicViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.topics.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicTableCell", for: indexPath)
        let data = self.topics.value[indexPath.row]
        cell.textLabel?.text = "\(indexPath.row + 1) - \(data.title)"
        cell.textLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idOfTopic = self.topics.value[indexPath.row].id
        presenter.getTopicId(id: idOfTopic)
        self.navigationController?.pushViewController(BookDependensy.build(), animated: true)
    }
    
}

extension TopicViewController: TopicViewDelegate{
    func getTopics(topic: Topics) {
        self.topics.value = topic
        self.tableView.reloadData()
    }
}
