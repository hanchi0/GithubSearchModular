//
//  GithubSearchAPI.swift
//  
//
//  Created by 한지민 on 2022/03/28.
//

import Moya
import Foundation

enum GithubSearchAPI {
    case fetchRepositories(text: String)
}

extension GithubSearchAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com/search/")!
    }
    
    var path: String {
        switch self {
        case .fetchRepositories:
            return "repositories"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchRepositories:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .fetchRepositories(let text):
            return .requestParameters(parameters: ["q" : text], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
