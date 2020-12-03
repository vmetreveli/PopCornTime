//
//  Router+Combine.swift
//  XCoordinatorCombine
//
//  Created by Paul Kraft on 28.08.19.
//  Copyright © 2018 QuickBird Studios. All rights reserved.
//

#if canImport(Combine) && canImport(XCoordinator)

import Combine
import XCoordinator

public struct PublisherExtension<Base> {
    public let base: Base
}

extension Router {
    public var publishers: PublisherExtension<Self> {
        .init(base: self)
    }
}

@available(iOS 13.0, *)
extension PublisherExtension where Base: Router {

    public func trigger(_ route: Base.RouteType,
                        with options: TransitionOptions = .init(animated: true)
        ) -> Future<Void, Never> {
        Future { completion in
            self.base.trigger(route, with: options) {
                completion(.success(()))
            }
        }
    }

}

#endif
