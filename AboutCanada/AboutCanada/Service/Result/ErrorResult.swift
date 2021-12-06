//
//  File.swift
//  AboutCanada
//
//  Created by Mohd Prophet on 06/12/21.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
extension ErrorResult: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .network(let message):
            return NSLocalizedString(message, comment: "Network Error")
        case .parser(let message):
            return NSLocalizedString(message, comment: "Parsing Error")
        case .custom(let message):
            return NSLocalizedString(message, comment: "Error")
        }
    }
}
