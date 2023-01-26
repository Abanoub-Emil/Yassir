//
//  MoviesListViewController.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import UIKit

final class MoviesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MoviesListViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "home_title".localized()
        setupBinding()
        setupTableView()
        viewModel?.viewDidLoad()
    }
    
    func setupTableView() {
        tableView.register(MoviesListTableViewCell.nib,
                                    forCellReuseIdentifier: MoviesListTableViewCell.identifier)
        tableView.estimatedRowHeight = Constants.tableViewRowEstimate.rawValue
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
    }

    private func setupBinding() {
        viewModel?.movies.bind({ [weak self] _ in
            self?.updateTable()
        })
        viewModel?.state.bind({ [weak self] state in
            self?.bindState(state: state ?? .populated)
        })
    }
    
    private func updateTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

// MARK: UITableViewDataSource

extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.movies.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MoviesListTableViewCell.identifier, for: indexPath) as? MoviesListTableViewCell, let movie = viewModel?.movies.value?[indexPath.row] {
            cell.configure(movie)
            return cell
        }

        return UITableViewCell()
    }
    
}

// MARK: UITableViewDelegate

extension MoviesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectMovie(index: indexPath.row)
    }
}

// MARK: Private

extension MoviesListViewController {
    
    private enum Constants: CGFloat {
        case tableViewRowEstimate = 175.0
    }

}
