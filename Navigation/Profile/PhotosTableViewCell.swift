//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by insomnia on 07.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var photoTable1: UIImageView = {
        let photoTable1 = UIImageView()
        photoTable1.translatesAutoresizingMaskIntoConstraints = false
        return photoTable1
    } ()
    
    private lazy var photoTable2: UIImageView = {
        let photoTable2 = UIImageView()
        photoTable2.translatesAutoresizingMaskIntoConstraints = false
        return photoTable2
    } ()
    
    private lazy var photoTable3: UIImageView = {
        let photoTable3 = UIImageView()
        photoTable3.translatesAutoresizingMaskIntoConstraints = false
        return photoTable3
    } ()
    
    private lazy var photoTable4: UIImageView = {
        let photoTable4 = UIImageView()
        photoTable4.translatesAutoresizingMaskIntoConstraints = false
        return photoTable4
    } ()
    
    private lazy var photoStackView: UIStackView = {
        let photoStackView = UIStackView()
        photoStackView.axis = .horizontal
        photoStackView.spacing = 20
        photoStackView.translatesAutoresizingMaskIntoConstraints = false
        return photoStackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        
        var constraints = [NSLayoutConstraint]()
        
        addSubview(photoStackView)
        photoStackView.addArrangedSubview(photoTable1)
        photoStackView.addArrangedSubview(photoTable2)
        photoStackView.addArrangedSubview(photoTable3)
        photoStackView.addArrangedSubview(photoTable4)
        
        constraints.append(photoStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20))
        constraints.append(photoStackView.leadingAnchor.constraint(equalTo: leadingAnchor))
        constraints.append(photoStackView.trailingAnchor.constraint(equalTo: trailingAnchor))
        constraints.append(photoStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20))
                
        NSLayoutConstraint.activate(constraints)
        
        for views in photoStackView.arrangedSubviews {
            views.heightAnchor.constraint(equalToConstant: 66).isActive = true
            views.widthAnchor.constraint(equalToConstant: 70).isActive = true
            views.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }
        
    }
    
    func set4photo(photo: PhotoView) {
        photoTable1.image = photo.photoName1
        photoTable2.image = photo.photoName2
        photoTable3.image = photo.photoName3
        photoTable4.image = photo.photoName4
    }
}

struct PhotoView {
    
    let photoName1:UIImage
    let photoName2:UIImage
    let photoName3:UIImage
    let photoName4:UIImage
}

struct Photos {
    static let photo1 = UIImage(named: "photo1")
    static let photo2 = UIImage(named: "photo2")
    static let photo3 = UIImage(named: "photo3")
    static let photo4 = UIImage(named: "photo4")
}