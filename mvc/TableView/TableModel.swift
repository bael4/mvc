//
//  TableModel.swift
//  mvc
//
//  Created by Баэль Рыспеков on 13/4/23.
//

import Foundation

struct User {
    var name: String
}

class TableModel {
    
    private weak var controller: TableController!
    private var dataManager = DataManager()
    
    init(controller: TableController!) {
        self.controller = controller
    }
    
    var users: [User] = []
    
    func getUsers () {
        dataManager.getUsers { gogogog in
            self.users = gogogog
            self.controller.reloadTableView()
        }
    }
    
}
