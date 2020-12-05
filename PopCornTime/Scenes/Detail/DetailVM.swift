//
//  DetailVM.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 04.12.20.
//

import Foundation
import XCoordinator
import Action

class DetailVM  {
    // MARK: Stored properties
    
    private let router: UnownedRouter<AppRoute>
    let movie: PopularMovieModel
    
    lazy var closeAction = CocoaAction { [unowned self] in
        self.router.rx.trigger(.dismiss)
    }
    
    
    init(router: UnownedRouter<AppRoute>, movie: PopularMovieModel) {
        self.router = router
        self.movie = movie
    }
}
