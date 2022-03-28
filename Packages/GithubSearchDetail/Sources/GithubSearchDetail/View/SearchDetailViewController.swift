//
//  SearchDetailViewController.swift
//  GithubSearchMVVM
//
//  Created by 한지민 on 2022/03/18.
//

import UIKit
import WebKit
import Combine
import Entity

class SearchDetailViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    var viewModel: (SearchDetailViewModelInput & SearchDetailViewModelOutput)!
    var cancelBag = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.repositoryPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] repository in
                self?.navigationItem.title = repository.full_name
                if let url = URL(string: repository.html_url) {
                    self?.webView.load(URLRequest(url: url))
                }
            }.store(in: &cancelBag)
    }
}
