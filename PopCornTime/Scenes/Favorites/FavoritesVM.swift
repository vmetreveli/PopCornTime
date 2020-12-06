//
//  FavoritesVM.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 05.12.20.
//

import Foundation
import XCoordinator
import RxSwift
import RxCocoa
import Action

class FavoritesVM {
    
    private let router: UnownedRouter<FavoritesRoute>
    private let dataManager: DataManagerProtocol
    var dataSource = BehaviorRelay(value: [Favorites]())
  
    init(router: UnownedRouter<FavoritesRoute>,  dataManager: DataManagerProtocol) {
        self.router = router
        self.dataManager = dataManager
    }
    
    func loadFavoritesMovies() -> Observable<[Favorites]> {
        return Observable.create { observer -> Disposable in
            observer.onNext(self.dataManager.getFavoritesFetchController())
            
            return Disposables.create()
        }
    }
    
    lazy var detailAction = Action<Favorites, Void> { [unowned self] model in
        
        let favorite = PopularMovieModel()
        favorite.id = Int(model.id)
        favorite.title = model.movieTitle
        favorite.overview = model.movieDescription
        favorite.posterPath = model.moviePoster
        favorite.voteAverage = model.voteAverage
        
      return self.router.rx.trigger(.detail(favorite))
   }
}

