//
//  ViewController.swift
//  ViewCodeAndMVVM
//
//  Created by Diego Rodrigues on 19/09/22.
//

import UIKit

class HomeViewController: UIViewController{
    
    let viewModel:ViewModel = ViewModel()
    
    var screen:HomeScreenView?
    
    override func loadView() {
        self.screen = HomeScreenView()
        self.screen?.setupTableViewProtols(delegate: self, dataSource: self)
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate(delegate: self)
        self.viewModel.fastchAllRequest()
        }
    

    
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
        cell?.setupCell(user: self.viewModel.loudCurrentUser(indexPath: indexPath))
        cell?.delegate(delegate: self)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.viewModel.getName(indexPath: indexPath))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 164
    }
}

extension HomeViewController:CustomTableViewCellDelegate{
    func tappedHeartButton(_ user: User) {
        self.viewModel.exchangeHearState(user)
    }
    
    
}

extension HomeViewController:ViewModelDelegate{
    func succesRequest() {
        self.screen?.setupTableViewProtols(delegate: self, dataSource: self)
        self.screen?.reloadTableView()

    }
    
    func ErrorRequest() {
        print("Error a realizar a request")
    }
    
}
