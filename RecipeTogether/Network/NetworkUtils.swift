//
//  NetworkUtils.swift
//  RecipeTogether
//
//  Created by Luis angel Quintero arias on 25/06/25.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}
