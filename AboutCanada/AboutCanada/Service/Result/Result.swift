//
//  Result.swift
//  AboutCanada
//
//  Created by Mohd Prophet on 06/12/21.
//

import Foundation

enum Result<About, E: Error> {
    case success(About)
    case failure(E)
}
