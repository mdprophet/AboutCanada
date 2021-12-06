//
//  FactsViewController+UI.swift
//  AboutCanada
//
//  Created by Mohd Prophet on 06/12/21.
//

import UIKit
extension FactsViewController{
    func setupTableView() {
        view.addSubview(tableView)
        addConstraints()
        configureTableView()
    }
    
    func configureTableView() {
            //Register TableViewCell
        tableView.register(FactsTableViewCell.self, forCellReuseIdentifier: FactsTableViewCell.identifier)
        
            //TableViewCell Dynamic Height
        tableView.estimatedRowHeight = 120.0
        tableView.rowHeight = UITableView.automaticDimension
        
            //To Avoid Extra Cells
        tableView.tableFooterView = UIView()
        
            //Add PullToRefresh
        tableView.addSubview(self.refreshControl)
    }
    
    private func addConstraints() {
            //Add Top,Leading,Bottom,Trailing Constraint to Safe Area
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}
