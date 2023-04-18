//
//  ProductCell.swift
//  mvc
//
//  Created by Баэль Рыспеков on 18/4/23.
//

import UIKit
import Kingfisher

class ProductCell: UICollectionViewCell {
    
    
    
    private lazy  var productImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .cyan
        return image
    }()
    
    
    private lazy var productLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
        
    }()
    
    
    
    private lazy var productDesc: UILabel = {
        
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
        addSubview(productImage)
        productImage.translatesAutoresizingMaskIntoConstraints = false
       
        addSubview(productLabel)
        productLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(productDesc)
        productDesc.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo:  self.topAnchor, constant: 10),
            productImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            productImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            productImage.heightAnchor.constraint(equalToConstant: 300),
            productImage.widthAnchor.constraint(equalToConstant: 300),
            
            productLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 10),
            productLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            productLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            
            productDesc.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 10),
            productDesc.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            productDesc.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10)
        ])
    }
    
    
    func fill (product: Product) {
        
        
        
        productImage.kf.setImage(with: URL(string: product.images[0]))
        productLabel.text = product.title
        
        
      }
}
