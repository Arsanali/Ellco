//
//  MainPresenter.swift
//  Ellco
//
//  Created by Arslanali on 31.01.2021.
//

import Foundation

protocol MainPresenter:class {
    func sendData()
    var tikets: Ticket? {get set}
    var view: MainView?{get set}
}

class MainPresenterImp:MainPresenter {

    weak var view: MainView?
    var tikets: Ticket?
    var networking: NetworkManager?
 
    init(view: MainView) {
        self.view = view
        self.networking = NetworkManagerImp()
    }
    
    func sendData() {
        networking?.getData { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    self.tikets = value
                    self.view?.showData()
                    print("Данные все таки пришли\(value)")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
