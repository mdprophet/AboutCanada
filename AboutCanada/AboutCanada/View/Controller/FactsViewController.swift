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
    let dataSource = FactsDataSource()
    
    lazy var viewModel : FactsViewModel = {
        let viewModel = FactsViewModel(dataSource: dataSource)
        return viewModel
    }()

    override func loadView() {
        super.loadView()
        safeArea = view.layoutMarginsGuide
        setupTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fetching Facts..."
        bindData()
        viewModel.fetchFacts()
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.title = "Refreshing Facts..."
            //Adding delay intentionally so that PullToReresh can be checked otherwise it's too fast that one is unable to guess what's happening
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.viewModel.fetchFacts()
        }
        
    }
}
