//
//  About.swift
//  AboutCanada
//
//  Created by Mohd Prophet on 06/12/21.
//

import Foundation
struct About: Codable {
    var screenTitle : String
    var facts : [Fact]
    
    enum CodingKeys: String, CodingKey {
        case screenTitle = "title"
        case facts = "rows"
    }
    
}
