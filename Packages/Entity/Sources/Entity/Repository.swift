//
//  Repository.swift
//  GithubSearchMVVM
//
//  Created by 한지민 on 2022/03/17.
//

import Foundation

public struct Repository: Codable {
    public let id: Int
    public let node_id: String
    public let full_name: String
    public let description: String?
    public let url: String
    public let html_url: String
    public let created_at: String
    public let updated_at: String
}
