//
//  SearchDetailViewModel.swift
//  GithubSearchMVVM
//
//  Created by 한지민 on 2022/03/18.
//

import Foundation
import Core
import Entity

protocol SearchDetailViewModelInput {
}

protocol SearchDetailViewModelOutput {
    var repositoryPublisher: Published<Repository>.Publisher { get }
}

protocol SearchDetailViewModelProtocol: BaseViewModelProtocol, SearchDetailViewModelInput, SearchDetailViewModelOutput {
    var repository: Repository { get }
}

class SearchDetailViewModel: SearchDetailViewModelProtocol {
    @Published var repository: Repository
    var repositoryPublisher: Published<Repository>.Publisher { $repository }
    var navigator: NavigatorProtocol?
    
    init(repository: Repository) {
        self.repository = repository
    }
}
