//
//  FactsViewController.swift
//  AboutCanada
//
//  Created by Mohd Prophet on 06/12/21.
//

import UIKit

class FactsViewController: UIViewController {
    var safeArea: UILayoutGuide!
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
                                    #selector(FactsViewController.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        return refreshControl
    }()
    
    override func loadView() {
        super.loadView()
        safeArea = view.layoutMarginsGuide
        setupTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fetching Facts..."
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.title = "Refreshing Facts..."        
    }
}
