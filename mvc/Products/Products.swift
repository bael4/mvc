//
//  ViewController.swift
//  mvc
//
//  Created by Баэль Рыспеков on 18/4/23.
//

import UIKit


class Products: UIViewController {
    
    var productsModel: [Product] = []
    
    private lazy var productColection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 20
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ProductCell.self, forCellWithReuseIdentifier: "id")
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubViews()
        fetchBeerList { result in
            self.productsModel = result.products
            DispatchQueue.main.async {
                self.productColection.reloadData()
            }
      
        }
    }
    
    
    private func setupSubViews () {
        
        view.backgroundColor = .yellow
        
        
        view.addSubview(productColection)
        productColection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productColection.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            productColection.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -100),
            productColection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            productColection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
    }
    
    
    func fetchBeerList (completion: @escaping (ProductsModel) -> ()) {
        let url = URL(string: "https://dummyjson.com/products")
        
        let request = URLRequest(url: url!)
        
       let task =  URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {return}
            
           do {
               let result = try JSONDecoder().decode(ProductsModel.self, from: data)
          
               completion(result)
           } catch {
               print(error)
           }
        }
        task.resume()
    }
    
    
}



extension Products: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return productsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as! ProductCell
        cell.fill(product: productsModel[indexPath.row])
        cell.backgroundColor = .systemGreen
        return cell
    }
    
    
}


extension Products: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 400)
    }
}
