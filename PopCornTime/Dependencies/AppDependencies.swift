//
//  AppDependencies.swift
//  MangaReader
//
//  Created by vakhushti metreveli on 26.11.20.
//

import Foundation

struct AppDependencies {
    //let profileManager: ProfileManagerProtocol
    let backendManager: BackendManager
  //  let appRequestManager: AppRequestManager
    let dataManager: DataManagerProtocol
 
    init(backendManager: BackendManager){//}, profileManager: ProfileManager) {
        self.backendManager = backendManager
        //self.profileManager = profileManager
//        self.appRequestManager = AppRequestManager(backendManager: backendManager)
        self.dataManager = DataManager()
    }
}
