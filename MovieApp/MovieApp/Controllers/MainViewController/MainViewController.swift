//
//  MainViewController.swift
//  MovieApp
//
//  Created by Arun Tiwari on 12.05.2025.
//

import UIKit
 
class MainViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    //Variables:
    var cellDataSource: [MovieTableCellViewModel] = []
    
    //Constant:
    let footerIndicator = UIActivityIndicatorView(style: .medium)
 
    override func viewDidLoad() {
        super.viewDidLoad()
 
        configView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    
    func configView() {
        self.title = "Top Animated Movies"
        self.view.backgroundColor = .systemBackground
        
        setupTableView()
        configureTableFooter()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.footerIndicator.startAnimating()
                    self.tableView.tableFooterView = self.footerIndicator
                } else {
                    self.footerIndicator.stopAnimating()
                    self.tableView.tableFooterView = nil
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
    
    func openDetail(movieID: Int) {
        guard let movie = viewModel.retriveMovie(with: movieID) else {
            return
        }
        let detailsViewModel = DetailsMovieViewModel(movie: movie)
        let detailsController = DetailsMovieViewController(viewModel: detailsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsController, animated: true)
        }
    }
    
    private func configureTableFooter() {
        footerIndicator.color = .black
        footerIndicator.hidesWhenStopped = true
        footerIndicator.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 44)
        tableView.tableFooterView = footerIndicator
    }
}
