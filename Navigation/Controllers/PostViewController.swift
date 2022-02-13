//
//  PostViewController.swift
//  Navigation
//
//  Created by insomnia on 12.02.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        let myPost = Post()
        let titleLabel = UILabel()
        titleLabel.text = myPost.title
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        let infoButton = UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: #selector(buttonInfoClicked))
        navigationItem.rightBarButtonItem = infoButton
    }
    
    @objc func buttonInfoClicked() {
        let infoViewController = InfoViewController()
        navigationController?.pushViewController(infoViewController, animated: true)
    }
}
