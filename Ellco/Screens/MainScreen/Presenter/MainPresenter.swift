//
//  MainPresenter.swift
//  Ellco
//
//  Created by Arslanali on 31.01.2021.
//

import Foundation

protocol MainPresenter:class {
    func sendData()
}

class MainPresenterImp:MainPresenter {
    
    
    var view: MainView?
    var model: [Ticket]
    var networking: NetworkManager?
    
    func sendData() {
        <#code#>
    }
}
