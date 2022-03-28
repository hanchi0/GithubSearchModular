//
//  SearchViewController.swift
//  GithubSearchMVVM
//
//  Created by 한지민 on 2022/03/17.
//

import Core
import UIKit
import Combine
import Entity

class SearchViewController: UIViewController {
    var viewModel: (SearchViewModelInput & SearchViewModelOutput)!
    var cancelBag = Set<AnyCancellable>()
    
    var displayedRepositories = [Repository]()
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "SearchTableViewCell", bundle: .module), forCellReuseIdentifier: "SearchTableViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        self.viewModel.repositoriesPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] repositories in
                self?.displayedRepositories = repositories
                self?.tableView.reloadData()
            }.store(in: &cancelBag)
    }
    
    func setup() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.navigateTo(with: .Detail(repository: self.displayedRepositories[indexPath.row]))
    }
}

extension SearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedRepositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as? SearchTableViewCell else {
            return UITableViewCell()
        }
        let data = self.displayedRepositories[indexPath.row]
        cell.setData(data: data)
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.fetchRepositories(text: searchBar.text)
    }
}
