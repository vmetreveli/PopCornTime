//
//  HomeVM.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 02.12.20.
//

import RxCocoa
import RxSwift
import UIKit
import XCoordinator
import Action

class HomeVM {
    
    // MARK: Stored properties
    
    private let router: UnownedRouter<HomeRoute>
    private let dependencies: AppRequestBMProtocol
    
   // var showDetailTrigger: AnyObserver<PopularMovieModel>
    
    //private(set) lazy var showDetailTrigger =  detailAction
    
    
    init(router: UnownedRouter<HomeRoute>, dependencies: AppRequestBMProtocol) {
        self.router = router
        self.dependencies = dependencies
      //  self.showDetailTrigger = detailAction.inputs
    }
    
    
    
    func loadPopularMovies() -> Observable<[PopularMovieModel]> {
        return Observable.create { observer -> Disposable in
            
            self.dependencies.getPopularMovie() { (responce) in
                //  guard let self = self else { return }
                switch responce {
                    case .success(let popularMovieWholeDataModel):
                        observer.onNext(popularMovieWholeDataModel)
                    case .failure(let error):
                        observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
    
     lazy var detailAction = Action<PopularMovieModel, Void> { [unowned self] model in
        
        model.posterPath = "\(Constant.imagebaseURL)\(model.posterPath!)"
      return   self.router.rx.trigger(.detail(model))
    }


}

