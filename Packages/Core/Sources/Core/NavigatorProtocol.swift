//
//  NavigatorProtocol.swift
//  
//
//  Created by 한지민 on 2022/03/28.
//

import UIKit

public protocol Step {}

public protocol NavigatorProtocol {
    var navigationViewController: UINavigationController? { get set }
    func navigateTo(navigation: Step)
}
