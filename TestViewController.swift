//
//  TestViewController.swift
//  SuperMemo
//
//  Created by Mikhail Levant on 13.08.2022.
//

import UIKit

class TestViewController : UIViewController {
    let stackview : UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .fillEqually
        return $0
    }(UIStackView(frame: .zero))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackview)
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: stackview.bottomAnchor, constant: 10),
            stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            //stackview.heightAnchor.constraint(equalToConstant: 60)
        ])
        stackview.addArrangedSubview(createButton(type: .sound))
        stackview.addArrangedSubview(createButton(type: .reset))
        stackview.addArrangedSubview(createButton(type: .vk))
    }
    enum ButtonType { case sound, reset, vk }
    func createButton(type : ButtonType) -> UIButton {
        let button = UIButton(type: .system)
        let imageName : String
        button.translatesAutoresizingMaskIntoConstraints = false
        switch type {
        case .sound:
            imageName = "africa"
        case .reset:
            imageName = "re"
        case .vk:
            imageName = "voka"
        }
        button.setBackgroundImage(UIImage(named: imageName), for: .normal)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalTo: button.widthAnchor)
        ])
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
        return button
    }
    
    @objc private func buttonDidTapped(_ sender: UIButton) {
        print("123")
    }
}
