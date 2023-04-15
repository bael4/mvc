//
//  TableController.swift
//  mvc
//
//  Created by Баэль Рыспеков on 13/4/23.
//

import UIKit


class TableController {
    
    private weak var view: TableView!
    private var model: TableModel?
    
    init(view: TableView) {
        self.view = view
        self.model = TableModel(controller: self)
    }
    
    
    func getUsersC () -> [User] {
        return model!.users
    }
    
    func reloadTableView() {
        view.reloadTableView()
    }
    
    func getData () {
        model?.getUsers()
    }
    
}
