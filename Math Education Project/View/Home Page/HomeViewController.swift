//
//  ViewController.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 16/04/2023.
//

import UIKit
import SnapKit

protocol HomeViewDelegate: AnyObject{
    func fetchCourses(courses: Course)
}

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterDelegate!
    
    var courses = Dynamic(Course())
    
    private lazy var contentSize = CGSize(width: view.frame.width, height: view.frame.height + 1300)
    
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
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var gradientView: GradientView = {
        let gradientV = GradientView(gradientStartColor: UIColor(red: 18/255, green: 77/255, blue: 193/255, alpha: 0.67), gradientEndColor: UIColor(red: 0/255, green: 20/255, blue: 58/255, alpha: 0.38))
        return gradientV
    }()
    
    private lazy var logoImage: UIImageView = {
        let imageV = UIImageView()
        imageV.backgroundColor = .white
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
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Слоган"
        label.font = .systemFont(ofSize: 48, weight: .bold)
        label.textColor = UIColor(red: 42/255, green: 67/255, blue: 119/255, alpha: 1)
        return label
    }()
    
    private lazy var homeImage: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(named: "homeImage")
        return imageV
    }()
    
    private lazy var booksTable: UITableView = {
        let tableV = UITableView()
        tableV.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableV.delegate = self
        tableV.dataSource = self
        tableV.separatorStyle = .none
        return tableV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
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
        
        contentView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(navigationParentView.snp.bottom).offset(70)
        }
        
        contentView.addSubview(homeImage)
        homeImage.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(headerLabel.snp.bottom).offset(16)
            make.height.equalTo(331)
        }
        
        contentView.addSubview(booksTable)
        booksTable.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(homeImage.snp.bottom).offset(48)
        }
    }
    
    @objc func burgerDidTapped(){
        self.navigationController?.pushViewController(MenuDependensy.build(), animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomTableViewCell()
        let data = courses.value[indexPath.row].text
        cell.fillData(title: data)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 236.63
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailDependensy.build()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeViewController{
    
}

extension HomeViewController: HomeViewDelegate{
    
    func fetchCourses(courses: Course){
        DispatchQueue.main.async {
            self.courses.value = courses
            self.booksTable.reloadData()
        }
    }
}


