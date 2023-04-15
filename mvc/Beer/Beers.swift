//
//  Beers.swift
//  mvc
//
//  Created by Баэль Рыспеков on 15/4/23.
//

import UIKit



class Beers: UIViewController {
    
    
    private lazy var beerColection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private func setupSubViews () {
        view.addSubview(beerColection)
        
        NSLayoutConstraint.activate([
            
        ])
        
    }
    
    
    func fetchBeerList (completion: @escaping ([Beer]) -> ()) {
        let url = URL(string: "https://api.punkapi.com/v2/beers/")
        
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {return}
            
            let res = try? JSONDecoder().decode([Beer].self, from: data)
            print(res!)
        }.resume()
    }
    
    
}
