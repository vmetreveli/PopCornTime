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
    
}

class FavoritesCoordinator: NavigationCoordinator<FavoritesRoute> {
    
    // MARK: Initialization

    init() {
        super.init(initialRoute: .home)
    }
    
    
    // MARK: Overrides
    
    override func prepareTransition(for route: FavoritesRoute) -> NavigationTransition {
        switch route {
            case .home:
                let viewController = FavoritesVC.instantiateFromStoryboard(storyboardName: "FavoritesView", storyboardId: "FavoritesView")
                let viewModel = FavoritesVM(router: unownedRouter)//, dependencies: dependencies.backendManager)
                viewController.bind(to: viewModel)
                return .push(viewController)
        }
    }
    
}
