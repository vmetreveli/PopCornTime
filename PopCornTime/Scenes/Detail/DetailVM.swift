//
//  DetailVM.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 04.12.20.
//

import Foundation
import XCoordinator
import Action
import RxSwift

class DetailVM  {
    // MARK: Stored properties
    
    private let router: UnownedRouter<HomeRoute>
    let movie: PopularMovieModel
    
    let dataManager: DataManagerProtocol
    
    lazy var closeAction = CocoaAction {
        [unowned self] in
        self.router.rx.trigger(.dismiss)
    }
    
 
    func save() -> Observable<String> {
        return Observable.create { observer -> Disposable in
            self.dataManager.saveFavorites(with: [self.movie])
           observer.onNext("Saved")
             return Disposables.create()
        }
        
    }
    
    
    
    
    init(router: UnownedRouter<HomeRoute>, movie: PopularMovieModel, dataManager: DataManagerProtocol) {
        self.router = router
        self.movie = movie
        self.dataManager = dataManager
    }
}
