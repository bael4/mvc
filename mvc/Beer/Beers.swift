//
//  Beers.swift
//  mvc
//
//  Created by Баэль Рыспеков on 15/4/23.
//

import UIKit



class Beers: UIViewController {
    
    var beers: [Beer] = []
    
    private lazy var beerColection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 20
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(BeerCell.self, forCellWithReuseIdentifier: "id")
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubViews()
        fetchBeerList { result in
            self.beers = result
            DispatchQueue.main.async {
                self.beerColection.reloadData()
            }
      
        }
    }
    
    
    private func setupSubViews () {
        
        view.backgroundColor = .yellow
        
        
        view.addSubview(beerColection)
        beerColection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            beerColection.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            beerColection.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -100),
            beerColection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            beerColection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
    }
    
    
    func fetchBeerList (completion: @escaping ([Beer]) -> ()) {
        let url = URL(string: "https://api.punkapi.com/v2/beers/")
        
        let request = URLRequest(url: url!)
        
       let task =  URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {return}
            
           do {
               let result = try JSONDecoder().decode([Beer].self, from: data)
               print(result)
               completion(result)
           } catch {
               print(error)
           }
        }
        task.resume()
    }
    
    
}



extension Beers: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        beers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as! BeerCell
        cell.fill(beer: beers[indexPath.row])
        cell.backgroundColor = .systemGreen
        return cell
    }
    
    
}


extension Beers: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 400)
    }
}
