//
//  ViewController.swift
//  Ellco
//
//  Created by Arslanali on 31.01.2021.
//

import UIKit

protocol MainView:class {
    func showData()
}

class ViewController: UIViewController {
        
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainPresenter?
    
    var tickets: [Ticket.BugTracker] = []

    //Заполняем массив категорий
    func setCharacteristic (product: [Ticket.BugTracker], presenter: MainPresenter) {
        self.tickets = product
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingPresenter()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func settingPresenter(){
        presenter = MainPresenterImp(view: self)
        presenter?.sendData()
    }

}

extension ViewController: MainView {

    func showData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            print("Данные пришли")
        }
    }
}


extension ViewController: UITableViewDataSource , UITableViewDelegate {
   
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.tikets?.bugTrackers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MainCell ,
              let model = presenter?.tikets?.bugTrackers[indexPath.row] else { return UITableViewCell()}
        cell.settingsCell(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = UIStoryboard.init(name: "DitailVC", bundle: nil).instantiateViewController(identifier: "DitailVC") as? DitailVC else {return}
        navigationController?.pushViewController(vc, animated: true)
        vc.model = presenter?.tikets?.bugTrackers[tableView.indexPathForSelectedRow?.row ?? 0]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
