//
//  GithubSearchInitializer.swift
//  
//
//  Created by 한지민 on 2022/03/28.
//

import UIKit
import Core

public struct GithubSearchInitializer {
    public init() {}
    public func start(with navigator: NavigatorProtocol) -> UIViewController {
        let viewController = UIStoryboard(name: "GithubSearch", bundle: Bundle.module).instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        let viewModel = SearchViewModel()
        viewModel.navigator = navigator
        viewController.viewModel = viewModel
        return viewController
    }
}
