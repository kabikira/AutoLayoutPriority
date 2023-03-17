//
//  ViewController.swift
//  AutoLayoutPriority
//
//  Created by koala panda on 2023/03/17.
//

import UIKit

class ViewController: UIViewController {
    var topView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView()
        view.backgroundColor = .white
        
        topView = UIView()
        topView.backgroundColor = .red
        topView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topView)
        
        // オートレイアウトの制約
        let constraint = topView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        // レイアウトの制約を有効化
        constraint.isActive = true
        // オートレイアウトの優勢度
        constraint.priority = .init(rawValue: 333)
        // 優先度がの数値を確認
        print(constraint.priority)
        
        
        let constraints: [NSLayoutConstraint] = [
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 100),
            
        ]
        NSLayoutConstraint.activate(constraints)
       
    }


}


