//
//  AboutCanadaViewModelTests.swift
//  AboutCanadaTests
//
//  Created by Mohd Prophet on 06/12/21.
//

import XCTest
@testable import AboutCanada

class FactsViewModelTests: XCTestCase {
    
    var viewModel : FactsViewModel!
    var dataSource : GenericDataSource<Fact,String>!
    fileprivate var service : MockFactsService!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        self.service = MockFactsService()
        self.dataSource = GenericDataSource<Fact,String>()
        self.viewModel = FactsViewModel(service: service, dataSource: dataSource)

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.viewModel = nil
        self.dataSource = nil
        self.service = nil
        super.tearDown()

    }

    func testFetchWithNoService() {
        
        let expectation = XCTestExpectation(description: "No service facts")
        
        // giving no service to a view model
        viewModel.service = nil
        
        // expected to not be able to fetch facts
        viewModel.onErrorHandling = { error in
            expectation.fulfill()
        }
        
        viewModel.fetchFacts()
        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchFacts() {
        
        let expectation = XCTestExpectation(description: "Facts fetch")
        
        // Providing a service mocking facts
        service.about = About(screenTitle: "Test About", facts: [])
        
        viewModel.onErrorHandling = { _ in
            XCTAssert(false, "ViewModel should not be able to fetch without service")
        }
        
        dataSource.data.addObserver(self) { _ in
            expectation.fulfill()
        }
        
        viewModel.fetchFacts()
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchNoFacts() {
        
        let expectation = XCTestExpectation(description: "No facts")
        
        // Providing a service mocking error during fetching facts
        service.about = nil
        
        // expected completion to fail
        viewModel.onErrorHandling = { error in
            expectation.fulfill()
        }
        
        viewModel.fetchFacts()
        wait(for: [expectation], timeout: 5.0)
    }

}
fileprivate class MockFactsService : FactsServiceProtocol {
    
    var about : About?

    func fetchFacts(_ completion: @escaping ((Result<About, ErrorResult>) -> Void)) {

        if let about = about {
            completion(Result.success(about))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "No Facts")))
        }
    }
}
