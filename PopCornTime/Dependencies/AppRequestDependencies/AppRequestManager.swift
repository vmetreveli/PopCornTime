//
//  AppRequestManager.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 26.11.20.
//

import Foundation
class AppRequestManager: AppRequestBMProtocol {
    func getPopularMovie(completionHandler: @escaping PopularMovieDataCompletionHandler) {
        backendManager.getPopularMovie(completionHandler: completionHandler)
    }
    
    
    var backendManager: AppRequestBMProtocol
    
    required init(backendManager: AppRequestBMProtocol) {
        self.backendManager = backendManager
    }
    
  
}
