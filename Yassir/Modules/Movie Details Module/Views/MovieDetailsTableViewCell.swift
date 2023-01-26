//
//  MovieDetailsTableViewCell.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import UIKit

final class MovieDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure(_ movie: MovieDetails) {
        moviePoster.loadImageFrom(url: movie.backdropPath ?? "")
        movieTitleLabel.text = movie.originalTitle ?? ""
        movieDateLabel.text = movie.releaseDate ?? ""
        movieOverviewLabel.text = movie.overview ?? ""
    }
}
