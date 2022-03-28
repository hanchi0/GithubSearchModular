//
//  GithubSearchDetailInitializer.swift
//  
//
//  Created by 한지민 on 2022/03/28.
//

import UIKit
import Core
import Entity

public struct GithubSearchDetailInitializer {
    public init() {}
    public func start(with navigator: NavigatorProtocol, repository: Repository) -> UIViewController {
        let viewController = UIStoryboard(name: "GithubSearchDetail", bundle: Bundle.module).instantiateViewController(withIdentifier: "SearchDetailViewController") as! SearchDetailViewController
        let viewModel = SearchDetailViewModel(repository: repository)
        viewModel.navigator = navigator
        viewController.viewModel = viewModel
        return viewController
    }
}
