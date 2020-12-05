//
//  FavoritesVM.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 05.12.20.
//

import Foundation
import XCoordinator

class FavoritesVM {
    
    private let router: UnownedRouter<FavoritesRoute>
   // let movie: PopularMovieModel
    
//    lazy var closeAction = CocoaAction { [unowned self] in
//        self.router.rx.trigger(.dismiss)
//    }
//    
    
    init(router: UnownedRouter<FavoritesRoute>) {
        self.router = router
       // self.movie = movie
    }
}
