//
//  FactsService.swift
//  AboutCanada
//
//  Created by Mohd Prophet on 06/12/21.
//

import Foundation

protocol FactsServiceProtocol : AnyObject {
    func fetchFacts(_ completion: @escaping ((Result<About, ErrorResult>) -> Void))
}

final class FactsService : RequestHandler, FactsServiceProtocol {
    
    static let shared = FactsService()
    
    let endpoint = "https://dl.dropboxusercontent.com/s/67zezivdylh8flh/Facts.json"
    var task : URLSessionTask?
    
    func fetchFacts(_ completion: @escaping ((Result<About, ErrorResult>) -> Void)) {
        
        // Cancel previous request if already in progress
        self.cancelFetchFacts()
        
        task = RequestService().loadData(urlString: endpoint, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchFacts() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
