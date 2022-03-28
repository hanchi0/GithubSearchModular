//
//  GithubSearchNavigator.swift
//  GithubSearchModular
//
//  Created by 한지민 on 2022/03/28.
//

import UIKit
import Core
import GithubSearch
import GithubSearchDetail

class GithubSearchNavigator: NavigatorProtocol {
    var navigationViewController: UINavigationController?
    
    func navigateTo(navigation: Step) {
        let navigation: GithubSearchStep = navigation as! GithubSearchStep
        switch navigation {
        case .Detail(let repository):
            let navigator = GithubSearchDetailNavigator()
            let rootViewController = navigationViewController
            navigator.navigationViewController = rootViewController
            let  viewController = GithubSearchDetailInitializer().start(with: navigator, repository: repository)
            rootViewController?.pushViewController(viewController, animated: true)
            break
        }
    }
}
