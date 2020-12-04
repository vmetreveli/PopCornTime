//
//  AppRequestBM.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 26.11.20.
//

import Foundation

protocol AppRequestBMProtocol: class {
    func getPopularMovie(completionHandler: @escaping PopularMovieDataCompletionHandler)
 
   
}

extension BackendManager: AppRequestBMProtocol{
    func getPopularMovie(completionHandler: @escaping PopularMovieDataCompletionHandler) {
        sendRequest(AppRequestRouter.getPopularMovies, successBlock: { [weak self] (result) in
            guard let strongSelf = self, let response = result as? Any else { completionHandler(.failure(.parsError))
                return }
            strongSelf.parsePopularMovieData(response, completionHandler: completionHandler)
            
        }) { (error) in
            completionHandler(.failure(error))
        }
    }
    
  
  
    private func parsePopularMovieData(_ json: Any, completionHandler: @escaping PopularMovieDataCompletionHandler ) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let movieData = try JSONDecoder().decode(ResponsePopularMovieModel.self, from: jsonData)
            guard let data = movieData.results else {return}
            completionHandler(.success(data))
        } catch {
            completionHandler(.failure(StatusMessage.parsError))
        }
    }
    
}
