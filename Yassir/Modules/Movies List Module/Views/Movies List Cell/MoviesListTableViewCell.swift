//
//  MoviesListTableViewCell.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import UIKit

final class MoviesListTableViewCell: UITableViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var voteRatingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure(_ movie: Movie) {
        moviePoster.loadImageFrom(url: movie.posterPath ?? "")
        movieTitleLabel.text = movie.originalTitle ?? ""
        popularityLabel.text = "\(movie.popularity ?? 0)"
        releaseDateLabel.text = movie.releaseDate ?? ""
        voteRatingLabel.text = "\(movie.voteAverage ?? 0)"
    }
}
