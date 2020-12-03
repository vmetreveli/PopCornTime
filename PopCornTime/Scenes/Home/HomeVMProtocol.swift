//
//  HomeVMProtocol.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 03.12.20.
//

import Foundation
import Action
import RxSwift
import XCoordinator


protocol HomeVMInput {
//    var alertTrigger: AnyObserver<Void> { get }
//    var closeTrigger: AnyObserver<Void> { get }
}

protocol HomeVMOutput {
   // var username: Observable<String> { get }
}

protocol HomeVMProtocol {
    var input: HomeVMInput { get }
    var output: HomeVMOutput { get }
}

extension HomeVMProtocol where Self: HomeVMInput & HomeVMOutput {
    var input: HomeVMInput { return self }
    var output: HomeVMOutput { return self }
}
