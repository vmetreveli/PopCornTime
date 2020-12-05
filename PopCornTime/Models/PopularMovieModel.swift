//
//  MangaModel.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 03.12.20.
//

import Foundation
import ObjectMapper

public class ResponsePopularMovieModel: BaseResponse<[PopularMovieModel]> {
    
}


public class PopularMovieModel: Codable {
    var adult: Bool? = nil
    var backdropPath: String? = ""
    var genreIDS: [Int]? = []
    var id: Int? = nil
    var originalLanguage:String? = ""
    var originalTitle: String? = ""
    var overview: String? = ""
    var popularity: Double? = nil
    var posterPath : String? = ""
    var releaseDate: String? = ""
    var title: String? = ""
    var video: Bool? = nil
    var voteAverage: Double? = nil
    var voteCount: Int? = nil
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


