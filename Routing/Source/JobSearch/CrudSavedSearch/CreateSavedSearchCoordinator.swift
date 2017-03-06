//
//  CreateSavedSearchCoordinator.swift
//  Routing
//
//  Created by Matt Fenwick on 3/5/17.
//  Copyright © 2017 mf. All rights reserved.
//

import Foundation
import RxSwift

class CreateSavedSearchCoordinator {

    let viewController: SavedSearchViewController

    private let presenter: CreateSavedSearchPresenter

    let cancel: Observable<Void>
    let save: Observable<Void>
    let delete: Observable<Void>

    init() {
        viewController = SavedSearchViewController()

        presenter = CreateSavedSearchPresenter()

        save = viewController.save
        delete = viewController.delete
        cancel = viewController.cancel
    }
}
