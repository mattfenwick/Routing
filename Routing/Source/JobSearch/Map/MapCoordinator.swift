//
//  MapCoordinator.swift
//  Routing
//
//  Created by Matt Fenwick on 3/5/17.
//  Copyright © 2017 mf. All rights reserved.
//

import Foundation

class MapCoordinator {

    let viewController: MapViewController

    private let presenter: MapPresenter

    init(interactor: MapInteractor) {
        viewController = MapViewController()
        presenter = MapPresenter(interactor: interactor)
    }
}
