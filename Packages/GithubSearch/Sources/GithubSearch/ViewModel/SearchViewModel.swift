//
//  SearchViewModel.swift
//  GithubSearchMVVM
//
//  Created by 한지민 on 2022/03/17.
//

import Foundation
import Combine
import SwiftUI
import Core
import Entity
import Network
import Moya

protocol SearchViewModelInput {
    func fetchRepositories(text: String?)
    func navigateTo(with step: GithubSearchStep)
}

protocol SearchViewModelOutput {
    var repositoriesPublisher: Published<[Repository]>.Publisher { get }
}

protocol SearchViewModelProtocol: BaseViewModelProtocol, SearchViewModelInput, SearchViewModelOutput {
    var repositories: [Repository] { get }
}

class SearchViewModel: SearchViewModelProtocol {
    @Published var repositories: [Repository] = []
    var repositoriesPublisher: Published<[Repository]>.Publisher { $repositories }
    var cancelBag = Set<AnyCancellable>()
    var navigator: NavigatorProtocol?
    
    func fetchRepositories(text: String?) {
        Network.sharedInstance.provider.request(MultiTarget(GithubSearchAPI.fetchRepositories(text: text ?? ""))) { result in
            result.publisher
                .map { $0.data }
                .decode(type: SearchResponse.self, decoder: JSONDecoder())
                .map { $0.items }
                .replaceError(with: [])
                .assign(to: \.repositories, on: self)
                .store(in: &self.cancelBag)
        }
    }
    
    func navigateTo(with step: GithubSearchStep) {
        navigator?.navigateTo(navigation: step)
    }
}
