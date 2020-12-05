//
//  Home.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 05.12.20.
//

import UIKit
import XCoordinator

enum HomeRoute: Route {
    case home(AppDependencies)
    case detail(PopularMovieModel)
    case dismiss
}

class HomeCoordinator: NavigationCoordinator<HomeRoute> {
    
    // MARK: Stored properties
    var dependencies: AppDependencies!
    var backendManager = BackendManager()
    
    // MARK: Initialization
    
    init() {
        dependencies = AppDependencies(backendManager: backendManager)
        super.init(initialRoute: .home(dependencies))
    }
    
    // MARK: Overrides
    
    override func prepareTransition(for route: HomeRoute) -> NavigationTransition {
        switch route {
             case .home(let dependencies):
                let viewController = HomeVC.instantiateFromStoryboard(storyboardName: "HomeView", storyboardId: "HomeView")
                let viewModel = HomeVM(router: unownedRouter, dependencies: dependencies.backendManager)
                viewController.bind(to: viewModel)
                return .push(viewController)
                
            case .detail(let movie):
                let viewController = DetailVC.instantiateFromStoryboard(storyboardName: "DetailView", storyboardId: "DetailView")
                let viewModel = DetailVM(router: unownedRouter, movie: movie)
                viewController.bind(to: viewModel)
                // viewController.presentPanModal(viewController)
                
                return .showDetail(viewController)
                
            case .dismiss:
                return .dismiss()
        }
    }
    
}
