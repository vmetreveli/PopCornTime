//
//  FavoritesCoordinator.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 05.12.20.
//

import Foundation


import XCoordinator

enum FavoritesRoute: Route {
    case home
    case detail(PopularMovieModel)
}

class FavoritesCoordinator: NavigationCoordinator<FavoritesRoute> {
    
    
    // MARK: Stored properties
    var dependencies: AppDependencies!
    var backendManager = BackendManager()
    
    // MARK: Initialization
    init() {
        dependencies = AppDependencies(backendManager: backendManager)
        super.init(initialRoute: .home)
    }
    
    
    // MARK: Overrides
    
    override func prepareTransition(for route: FavoritesRoute) -> NavigationTransition {
        switch route {
            case .home:
                let viewController = FavoritesVC.instantiateFromStoryboard(storyboardName: "FavoritesView", storyboardId: "FavoritesView")
                let viewModel = FavoritesVM(router: unownedRouter,  dataManager: dependencies.dataManager)//, dependencies: dependencies.backendManager)
                viewController.bind(to: viewModel)
                return .push(viewController)
                
            case .detail(let movie):
                let viewController = DetailVC.instantiateFromStoryboard(storyboardName: "DetailView", storyboardId: "DetailView")
                let viewModel = DetailVM(router: DetailCoordinator(movie: movie).unownedRouter, movie: movie, dataManager: dependencies.dataManager)
                viewController.bind(to: viewModel)
                return .push(viewController)
        }
    }
    
}
