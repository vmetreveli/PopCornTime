//
//  Favorites+Ex.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 05.12.20.
//

import CoreData

extension Favorites {
    
    func config(with model: PopularMovieModel) {
        id = Int64(model.id!)
        movieTitle = model.title
        moviePoster = model.posterPath
        voteAverage = model.voteAverage ?? 0
        movieDescription = model.overview
        // endDate = offerModel.endDate.toDate(format: "yyyy-MM-dd")
    }
}
