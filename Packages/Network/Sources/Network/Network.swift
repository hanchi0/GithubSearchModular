//
//  Network.swift
//
//
//  Created by 한지민 on 2022/02/18.
//

import Moya
import RxMoya

public class Network {
    public static let sharedInstance = Network()
    private init() {}
    public var provider = MoyaProvider<MultiTarget>()
}
