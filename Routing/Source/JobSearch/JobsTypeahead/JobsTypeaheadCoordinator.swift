//
//  JobsTypeaheadCoordinator.swift
//  Routing
//
//  Created by Matt Fenwick on 3/5/17.
//  Copyright © 2017 mf. All rights reserved.
//

import Foundation
import RxSwift

class JobsTypeaheadCoordinator {

    let viewController: JobsTypeaheadViewController

    private let presenter: JobsTypeaheadPresenter

    // TODO: note: will only produce events if VC is presented in a nav bar
    let didTapCancel: Observable<Void>
    let didTapQueryPrediction: Observable<Void>
    let didTapEditSavedSearch: Observable<Void>

    init(interactor: JobsTypeaheadInteractor) {
        viewController = JobsTypeaheadViewController()
        presenter = JobsTypeaheadPresenter()

        didTapCancel = viewController.didTapCancel
        didTapQueryPrediction = viewController.didTapPrediction
        didTapEditSavedSearch = viewController.didTapEditSavedSearch
    }
}
