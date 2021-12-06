//
//  FactsViewController+Bind.swift
//  AboutCanada
//
//  Created by Mohd Prophet on 06/12/21.
//

import UIKit
extension FactsViewController{
    func bindData() {
            //Observe Service Response
        tableView.dataSource = dataSource
        dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            guard let sSelf = self else { return }
            sSelf.tableView.reloadData()
            sSelf.title = sSelf.dataSource.data.title
            if sSelf.refreshControl.isRefreshing {
                sSelf.refreshControl.endRefreshing()
            }
        }
        
            //Error Handling
        self.viewModel.onErrorHandling = { [weak self] error in
            guard let sSelf = self else { return }
            if sSelf.refreshControl.isRefreshing{
                sSelf.refreshControl.endRefreshing()
                sSelf.title = ""
            }
            
                // display error
            let controller = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            sSelf.present(controller, animated: true, completion: nil)
        }
        
    }
}
