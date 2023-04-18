//
//  BeerCell.swift
//  mvc
//
//  Created by Баэль Рыспеков on 15/4/23.
//

import UIKit
import Kingfisher

class BeerCell: UICollectionViewCell {
    
    
    
    private lazy  var beerImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .cyan
        return image
    }()
    
    
    private lazy var beerLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
        
    }()
    
    
    
    private lazy var beerDesc: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 2
        return label
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    func setupSubViews () {
        addSubview(beerImage)
        beerImage.translatesAutoresizingMaskIntoConstraints = false
       
        addSubview(beerLabel)
        beerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(beerDesc)
        beerDesc.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            beerImage.topAnchor.constraint(equalTo:  self.topAnchor, constant: 10),
            beerImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            beerImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            beerImage.heightAnchor.constraint(equalToConstant: 300),
            beerImage.widthAnchor.constraint(equalToConstant: 300),
            
            beerLabel.topAnchor.constraint(equalTo:  beerImage.bottomAnchor, constant: 10),
            beerLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            beerLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            
            beerDesc.topAnchor.constraint(equalTo:  beerLabel.bottomAnchor, constant: 10),
            beerDesc.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            beerDesc.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10)
        ])
    }
    
    
    func fill (beer: Beer) {
        beerImage.kf.setImage(with: URL(string: beer.image_url))
        beerLabel.text = beer.name
        beerDesc.text = beer.description
    }
}

