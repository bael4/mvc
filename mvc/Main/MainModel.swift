//
//  MainModel.swift
//  mvc
//
//  Created by Баэль Рыспеков on 12/4/23.
//

class MainModel {
    
    private weak var controller: MainController!
    
    private var count: Int = 0
    
    init(controller: MainController) {
        self.controller = controller
    }
    
    func minus () -> Int {
        count -= 1
        return count
    }
    
    func plus () -> Int {
        count += 1
        return count
    }
    
}
