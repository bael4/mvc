//
//  TableView.swift
//  mvc
//
//  Created by Баэль Рыспеков on 13/4/23.
//

import UIKit


class TableView: UIViewController {
    
    
    private var controller: TableController!
    
    private lazy var namesTableView: UITableView = {
        let view = UITableView ()
        view.register(UITableViewCell.self, forCellReuseIdentifier: "names_cell")
        view.dataSource = self
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller = TableController(view: self)
        controller.getData()
        setupSubViews()
    }
    
    private func setupSubViews () {
        view.addSubview(namesTableView)
        namesTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            namesTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            namesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -100),
            namesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            namesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    
    func reloadTableView () {
        namesTableView.reloadData()
    }
    
}



extension TableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        controller.getUsersC().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "names_cell", for: indexPath)
        cell.textLabel?.text = controller.getUsersC()[indexPath.row].name
        return cell
    }
    
    
}
