//
//  Home.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 05.12.20.
//

import UIKit
import XCoordinator

public enum HomeRoute: Route {
    case favorites
    case detail(PopularMovieModel)
    case dismiss
}

public class HomeCoordinator: TabBarCoordinator<HomeRoute> {
    
    // MARK: Stored properties
    
    private let favoritesRouter: StrongRouter<FavoritesRoute>
    // private let userListRouter: StrongRouter<UserListRoute>
    
    // MARK: Initialization
    
    convenience init() {
        let favoritesCoordinator = FavoritesCoordinator()
        favoritesCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        
        //        let userListCoordinator = UserListCoordinator()
        //        userListCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        self.init(favoritesRouter: favoritesCoordinator.strongRouter)
    }
    
    init(favoritesRouter: StrongRouter<FavoritesRoute>) {
        self.favoritesRouter = favoritesRouter
        //self.userListRouter = userListRouter
        
        super.init(tabs: [favoritesRouter], select: favoritesRouter)
    }
    
    // MARK: Overrides
    
    public override func prepareTransition(for route: HomeRoute) -> TabBarTransition {
        switch route {
            case .favorites:
                return .select(favoritesRouter)
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
