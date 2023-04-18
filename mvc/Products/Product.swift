//
//  Product.swift
//  mvc
//
//  Created by Баэль Рыспеков on 18/4/23.
//

import Foundation




struct ProductsModel: Codable {
    var products: [Product]
}

struct Product: Codable {
    var title: String
    var description: String
    var images: [String]
}



