//
//  testV.swift
//  Math Education Project
//
//  Created by Шермат Эшеров on 12/05/2023.
//

import Foundation
import UIKit

class TestViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonTitles = ["Button 1", "Long Button Title TIle 2", "Button 3", "Long Button Title TIle title"]
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        for title in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .blue
            
            // Set dynamic button width based on title length
            button.widthAnchor.constraint(equalToConstant: calculateButtonWidth(title: title)).isActive = true
            
            // Set fixed button height
            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            stackView.addArrangedSubview(button)
        }
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func calculateButtonWidth(title: String) -> CGFloat {
        let buttonPadding: CGFloat = 20
        let font = UIFont.systemFont(ofSize: 17) // Adjust font size as needed
        
        let buttonWidth = title.size(withAttributes: [.font: font]).width + buttonPadding
        let minimumButtonWidth: CGFloat = 320 // Set a minimum width if needed
        
        return max(buttonWidth, minimumButtonWidth)
    }
}
