//
//  DetailCoordinator.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 06.12.20.
//

import Foundation


import XCoordinator

enum DetailsRoute: Route {
    case dismiss
    case home(PopularMovieModel)
}

class DetailCoordinator: NavigationCoordinator<DetailsRoute> {
    
    // MARK: Stored properties
    var dependencies: AppDependencies!
    var backendManager = BackendManager()
    
    // MARK: Initialization
    init(movie:  PopularMovieModel) {
        dependencies = AppDependencies(backendManager: backendManager)
        super.init(initialRoute: .home(movie))
    }
    
    override func prepareTransition(for route: DetailsRoute) -> NavigationTransition {
        switch route {
        case  .home(let movie):
            let viewController = DetailVC.instantiateFromStoryboard(storyboardName: "DetailView", storyboardId: "DetailView")
            let viewModel = DetailVM(router: unownedRouter, movie: movie, dataManager: dependencies.dataManager)
            viewController.bind(to: viewModel)
           return .showDetail(viewController)
        case .dismiss:
            //return .dismissToRoot()
            let alert = UIAlertController(title: "f", message: "message", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            return .present(alert)
        }
    }
    
}
