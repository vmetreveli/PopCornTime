//
//  AppCooordinator.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 02.12.20.
//

import Foundation
import XCoordinator
import UIKit

enum AppRoute: Route {
    case home(AppDependencies)
    case favorite
    //case detail(PopularMovieModel)
    //case dismiss
}

class AppCoordinator: TabBarCoordinator<AppRoute>{
    
    var dependencies: AppDependencies!
    var backendManager = BackendManager()
    

    // MARK: Stored properties
    
    private let favoritesRouter: StrongRouter<FavoritesRoute>
    private let homeRouter: StrongRouter<HomeRoute>
    
    // private let userListRouter: StrongRouter<UserListRoute>
    
    // MARK: Initialization
    
    convenience init() {
        
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icons8-fire"), tag: 0)
      
        let favoritesCoordinator = FavoritesCoordinator()
        favoritesCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icons8-star"), tag: 1)
         
        self.init(favoritesRouter: favoritesCoordinator.strongRouter, homeRouter: homeCoordinator.strongRouter)
    }
    
    init(favoritesRouter: StrongRouter<FavoritesRoute>, homeRouter: StrongRouter<HomeRoute>) {
        self.favoritesRouter = favoritesRouter
        self.homeRouter = homeRouter
        
        super.init(tabs: [homeRouter, favoritesRouter], select: homeRouter)
    }
    // MARK: Overrides
    
    override func prepareTransition(for route: AppRoute) -> TabBarTransition {
        switch route {
        case .home(let _):
                return .select(homeRouter)
                
            case .favorite:
                return .select(favoritesRouter)
        }
        
    }
}
