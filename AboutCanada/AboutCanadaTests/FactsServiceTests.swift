//
//  FactsServiceTests.swift
//  AboutCanadaTests
//
//  Created by Mohd Prophet on 06/12/21.
//

import XCTest
@testable import AboutCanada

class FactsServiceTests: XCTestCase {
    
    func testCancelRequest() {
        
        // giving a "previous" session
        FactsService.shared.fetchFacts { (_) in
            // ignore call
        }
        
        // Expected to task nil after cancel
        FactsService.shared.cancelFetchFacts()
        XCTAssertNil(FactsService.shared.task, "Expected task nil")
    }

}
