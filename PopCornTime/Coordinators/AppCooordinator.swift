//
//  AppCooordinator.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 02.12.20.
//

import Foundation
import XCoordinator

enum AppRoute: Route {
    case home(AppDependencies)
}

class AppCoordinator: NavigationCoordinator<AppRoute>{
  
    var dependencies: AppDependencies!
    var backendManager = BackendManager()


    // MARK: Initialization

    init() {
        dependencies = AppDependencies(backendManager: backendManager)
        super.init(initialRoute: .home(dependencies))
    }

    // MARK: Overrides

    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .home(let dependencies):
            let viewController = HomeVC.instantiateFromStoryboard(storyboardName: "HomeView", storyboardId: "HomeView")
            let viewModel = HomeVM(router: unownedRouter, dependencies: dependencies.backendManager)
            viewController.bind(to: viewModel)
            return .push(viewController)
        }
        
    }
}
