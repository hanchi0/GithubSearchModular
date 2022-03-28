//
//  GithubSearchStep.swift
//  
//
//  Created by 한지민 on 2022/03/28.
//

import Foundation
import Core
import Entity

public enum GithubSearchStep: Step {
    case Detail(repository: Repository)
}
