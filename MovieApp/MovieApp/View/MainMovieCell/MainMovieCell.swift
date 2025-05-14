//
//  MainMovieCell.swift
//  MovieApp
//
//  Created by Arun Tiwari on 12.05.2025.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {
    
    public static var identifier: String {
        get {
            return "MainMovieCell"
        }
    }
    
    public static func register() ->UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.movieImageView.startShimmerEffect()
        }
    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating

        self.movieImageView.sd_setImage(with: viewModel.imageUrl, placeholderImage: nil, options: [], completed: { [weak self] _, _, _, _ in
            self?.movieImageView.stopShimmerEffect()
        })
    }

}
