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

private let router: UnownedRouter<AppRoute>
private let dependencies: AppRequestBMProtocol
   
    init(router: UnownedRouter<AppRoute>, dependencies: AppRequestBMProtocol) {
        self.router = router
        self.dependencies = dependencies
    }
    
    
    func loadPopularMovies() -> Observable<[PopularMovieModel]> {
        
        return Observable.create { observer -> Disposable in

            self.dependencies.getPopularMovie() { [weak self] (responce) in
            guard let self = self else { return }
            switch responce {
            case .success(let popularMovieWholeDataModel):
                observer.onNext(popularMovieWholeDataModel)
            case .failure(let error):
                observer.onError(error)
                print(error)
               // comlpetion(false)
            }
          
        }
            //
           // let arr = self.dataManager.getBranches()
           // self.branchesList = arr
         //   comlpetion(arr)
            return Disposables.create()
        }
    }
}

