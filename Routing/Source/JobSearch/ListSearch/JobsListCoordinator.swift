//
//  JobsListCoordinator.swift
//  Routing
//
//  Created by Matt Fenwick on 3/5/17.
//  Copyright © 2017 mf. All rights reserved.
//

import Foundation
import RxSwift

class JobsListCoordinator {

    let viewController: JobsListViewController

    private let presenter: JobsListPresenter

    let didTapCancel: Observable<Void>
    let didTapJob: Observable<Void>
    let didTapSaveSearch: Observable<Void>
    let didTapShowFilters: Observable<Void>

    init(interactor: JobsListInteractor) {
        viewController = JobsListViewController()

        presenter = JobsListPresenter()

        didTapCancel = viewController.cancel
        didTapJob = viewController.showJobDetail
        didTapSaveSearch = viewController.showSaveSearch
        didTapShowFilters = viewController.showFilters
    }
}
