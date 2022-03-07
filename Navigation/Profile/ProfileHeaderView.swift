//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by insomnia on 13.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private lazy var name: UILabel = {
        let name = UILabel()
        name.text = "K1LL B1LL"
        name.font = .systemFont(ofSize: 35, weight: .bold)
        name.adjustsFontSizeToFitWidth = true
        name.minimumScaleFactor = 0.5
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var status: UITextView = {
        let status = UITextView()
        status.backgroundColor = .systemGray4
        status.font = .systemFont(ofSize: 20)
        status.textColor = .systemGray
        status.text = " status"
        status.layer.cornerRadius = 5
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Waiting with something..."
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 0.5
        textField.returnKeyType = .done
        textField.autocapitalizationType = .words
        textField.font = .systemFont(ofSize: 15)
        textField.textColor = .systemGray2
        textField.backgroundColor = .systemGray5
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.clearButtonMode = .always
        textField.alpha = 0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    } ()
    
    private lazy var showButton: UIButton = {
        let showButton = UIButton()
        showButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showButton.setTitle("Create Status", for: .normal)
        showButton.backgroundColor = .systemBlue
        showButton.layer.cornerRadius = 7
        showButton.layer.shadowColor = UIColor.black.cgColor
        showButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        showButton.layer.shadowRadius = 5
        showButton.layer.shadowOpacity = 0.3
        showButton.translatesAutoresizingMaskIntoConstraints = false
        return showButton
    }()
    
//    private lazy var newButton: UIButton = {
//        let newButton = UIButton()
//        newButton.setTitle("edit profile", for: .normal)
//        newButton.backgroundColor = .gray
//        newButton.layer.cornerRadius = 7
//        newButton.translatesAutoresizingMaskIntoConstraints = false
//        return newButton
//    }()

    let avatarImage: UIImageView = {
        let portrait = UIImage(named: "portrait")
        let avatarImage = UIImageView(image: portrait)
        avatarImage.layer.shadowColor = UIColor.black.cgColor
        avatarImage.layer.shadowOffset = CGSize(width: 10, height: 10)
        avatarImage.layer.shadowRadius = 10
        avatarImage.layer.shadowOpacity = 0.3
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        return avatarImage
    } ()
    
    lazy var favorites: UILabel = {
        let favorites = UILabel()
        favorites.text = "Likes:"
        favorites.font = .systemFont(ofSize: 20, weight: .light)
        favorites.adjustsFontSizeToFitWidth = true
        favorites.minimumScaleFactor = 0.5
        favorites.translatesAutoresizingMaskIntoConstraints = false
        return favorites
    }()

    @objc func buttonPressed() {
        status.text = textField.text
        status.textColor = .black
        textField.text = ""
        UIView.animate(withDuration: 1.0) {
            self.showButton.frame = CGRect(x: 188, y: 180, width: 160, height: 50)
            self.textField.alpha = 1
            self.endEditing(true)
            if self.status.hasText {
                self.showButton.setTitle("Change Status", for: .normal)
                self.textField.alpha = 0
                self.showButton.frame = CGRect(x: 188, y: 120, width: 160, height: 50)
            }
        }
    }
    
    @objc func tap(_ sender: Any) {
        textField.resignFirstResponder()
    }
    
    private lazy var labelStackView: UIStackView = {
        let labelstackView = UIStackView()
        labelstackView.axis = .vertical
        labelstackView.distribution = .fillEqually
        labelstackView.spacing = 20
        labelstackView.translatesAutoresizingMaskIntoConstraints = false
        return labelstackView
    }()

    private func addConstraints() {
        
        self.addSubview(labelStackView)
        self.addSubview(avatarImage)
        self.addSubview(textField)
        self.addSubview(showButton)
        self.addSubview(favorites)
        labelStackView.addArrangedSubview(name)
        labelStackView.addArrangedSubview(status)
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(avatarImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor))
        constraints.append(avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10))
        constraints.append(avatarImage.trailingAnchor.constraint(equalTo: labelStackView.leadingAnchor, constant: -30))
        constraints.append(avatarImage.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 40))
        
        constraints.append(labelStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor))
        constraints.append(labelStackView.widthAnchor.constraint(equalToConstant: 160))
        constraints.append(labelStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30))
        
        constraints.append(textField.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 20))
        constraints.append(textField.centerXAnchor.constraint(equalTo: labelStackView.centerXAnchor))
        constraints.append(textField.widthAnchor.constraint(equalToConstant: 160))
        constraints.append(textField.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 350))
        
        constraints.append(showButton.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 20))
        constraints.append(showButton.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 30))
        constraints.append(showButton.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -30))
        constraints.append(showButton.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 350))
        constraints.append(showButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(showButton.widthAnchor.constraint(equalToConstant: 160))
        
        constraints.append(favorites.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 10))
        constraints.append(favorites.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20))
        constraints.append(favorites.widthAnchor.constraint(equalToConstant: 250))
        constraints.append(favorites.heightAnchor.constraint(equalToConstant: 50))

        NSLayoutConstraint.activate(constraints)
    }
}
