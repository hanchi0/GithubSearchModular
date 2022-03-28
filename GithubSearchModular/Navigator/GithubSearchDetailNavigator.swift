//
//  GithubSearchDetailNavigator.swift
//  GithubSearchModular
//
//  Created by 한지민 on 2022/03/28.
//

import UIKit
import Core
import GithubSearchDetail

class GithubSearchDetailNavigator: NavigatorProtocol {
    var navigationViewController: UINavigationController?
    
    func navigateTo(navigation: Step) {
        let navigation: GithubSearchDetailStep = navigation as! GithubSearchDetailStep
        switch navigation {
        }
    }
}
