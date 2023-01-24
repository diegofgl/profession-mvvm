//
//  HomeScreenView.swift
//  ViewCodeAndMVVM
//
//  Created by Diego Rodrigues on 19/11/22.
//

import UIKit

class HomeScreenView: UIView {
    
    lazy var tableview: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.tableview)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func setupTableViewProtols(delegate:UITableViewDelegate, dataSource:UITableViewDataSource){
        self.tableview.delegate = delegate
        self.tableview.dataSource = dataSource
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.tableview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableview.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    
    
}
