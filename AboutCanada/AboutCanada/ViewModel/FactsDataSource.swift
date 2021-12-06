//
//  FactsDataSource.swift
//  AboutCanada
//
//  Created by Mohd Prophet on 06/12/21.
//

import Foundation
import UIKit

class GenericDataSource<T,String> : NSObject {
    var data: DynamicValue<[T],String> = DynamicValue([],"" as! String)
}

class FactsDataSource: GenericDataSource<Fact,String>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = FactsTableViewCell(style: .default,
                                       reuseIdentifier: FactsTableViewCell.identifier)
        let fact = data.value[indexPath.row]
        cell.populateCell(data:fact)
        return cell
    }
    
    
}

