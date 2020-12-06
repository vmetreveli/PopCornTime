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

public enum Status{
    case remove
    case save
}

class DetailVM {
    // MARK: Stored properties
    
    private let router: UnownedRouter<HomeRoute>
    var movie: PopularMovieModel
    
    let dataManager: DataManagerProtocol
    
    lazy var closeAction = CocoaAction {
        [unowned self] in
      self.router.rx.trigger(HomeRoute.dismiss)
    }
    
    init(router: UnownedRouter<HomeRoute>, movie: PopularMovieModel, dataManager: DataManagerProtocol) {
        self.router = router
        self.movie = movie
        self.dataManager = dataManager
    }
    
    func save() -> Observable<Status> {
        return Observable.create { observer -> Disposable in
            
            if self.dataManager.getFavorites(by: Int32(self.movie.id!)) == nil
            {
              //  self.movie.posterPath =
                self.dataManager.saveFavorites(with: [self.movie])
                observer.onNext(.save)
            }else{
                self.dataManager.deleteFavorite(by: Int32(self.movie.id!))
                observer.onNext(.remove)
            }
            
            //  self.dataManager.saveFavorites(with: [self.movie])
            
            
            return Disposables.create()
        }
    }
    
    func loadFavorites() -> Observable<Status> {
        return Observable.create { observer -> Disposable in
            if self.dataManager.getFavorites(by: Int32(self.movie.id!)) != nil
            {
                observer.onNext(.save)
            }else{
                observer.onNext(.remove)
            }
            return Disposables.create()
        }
    }
    
}
