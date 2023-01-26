//
//  MovieDetailsViewController.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import UIKit

final class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MovieDetailsViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "movie_details".localized()
        setupBinding()
        setupTableView()
        viewModel?.viewDidLoad()
    }
    
    func setupTableView() {
        tableView.register(MovieDetailsTableViewCell.nib,
                           forCellReuseIdentifier: MovieDetailsTableViewCell.identifier)
        tableView.estimatedRowHeight = Constants.tableViewRowEstimate.rawValue
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
    }
    
    private func setupBinding() {
        viewModel?.movieDetails.bind({ [weak self] _ in
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

extension MovieDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.movieDetails.value != nil ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MovieDetailsTableViewCell.identifier, for: indexPath) as? MovieDetailsTableViewCell, let movieDetails = viewModel?.movieDetails.value {
            cell.configure(movieDetails)
            return cell
        }
        
        return UITableViewCell()
    }
    
}

// MARK: Private

extension MovieDetailsViewController {
    
    private enum Constants: CGFloat {
        case tableViewRowEstimate = 700.0
    }
    
}
