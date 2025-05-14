//
//  MainViewController.swift
//  MovieApp
//
//  Created by Arun Tiwari on 12.05.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    //IBOutlet:
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndıcator: UIActivityIndicatorView!
    
    //ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    //Variables:
    var cellDataSource: [MovieTableCellViewModel] = []
    
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
    }
    
    
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndıcator.startAnimating()
                } else {
                    self.activityIndıcator.stopAnimating()
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
}
