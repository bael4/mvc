//
//  MainController.swift
//  mvc
//
//  Created by Баэль Рыспеков on 12/4/23.
//

import UIKit


class MainController {
    
   private weak var view: MainView!
   private var model: MainModel?
    
    init(view: MainView) {
        self.view = view
        self.model = MainModel(controller: self)
    }
    
    func plusNumberC () -> Int {
        return (model?.plus())!
    }
    
    func minusNumberC () -> Int  {
        return (model?.minus())!
    }
}
