//
//  SearchResponse.swift
//  GithubSearchMVC
//
//  Created by 한지민 on 2022/03/17.
//

import Foundation
import Entity

struct SearchResponse: Codable {
    var total_count: Int = 0
    var incomplete_results: Bool = false
    var items: [Repository] = []
}
