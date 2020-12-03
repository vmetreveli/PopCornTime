//
//  AppRequestRouter.swift
//  MangaReader
//
//  Created by vakhushti metreveli on 26.11.20.
//

import Alamofire

enum AppRequestRouter: RequestRouter {

    case getPopularMovies
    case getTopRatedMovies
    // case getBranches
    // case getUserData(_ accessToken: String)
    // case getTransactionHistory
    
    
    var method: HTTPMethod {
        switch self {
            default:
                return .get
               // return .post
        }
    }
    
    var path: String {
        switch self {
            case .getPopularMovies:
                return "popular"
            case .getTopRatedMovies:
                return "top_rated"
        }
    }
    
    var parameters: Parameters? {
        var params: [String:Any] = [:]
        params = ["api_key": "16469fcd24a79b005d4886e4e3c56ede"]
        
        //        switch self {
        //            case .getBranches:
        //                params = ["start": 0, "pageSize": 100000]
        //            case .getUserData(let accessToken):
        //                params = ["accessToken": accessToken]
        //            default:
        //                break
        //        }
        return params
    }
}
