//
//  ListSearchFlowController.swift
//  Routing
//
//  Created by Matt Fenwick on 3/5/17.
//  Copyright © 2017 mf. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

class ListSearchFlowController {

    let viewController: UIViewController

    let didTapCancel: Observable<Void>

    private let typeaheadCoordinator: JobsTypeaheadCoordinator
    private let disposeBag = DisposeBag()
    private let interactor: ListSearchInteractor

    private var jobsListFlowController: JobsListFlowController? = nil
//    private var editSavedSearchCoordinator:

    init(interactor: ListSearchInteractor) {
        self.interactor = interactor
        typeaheadCoordinator = JobsTypeaheadCoordinator(interactor: interactor)
        viewController = typeaheadCoordinator.viewController

        didTapCancel = typeaheadCoordinator.didTapCancel

        typeaheadCoordinator.didTapEditSavedSearch
            .subscribe(onNext: { [unowned self] in
                self.typeaheadDidTapEditSavedSearch()
            })
            .addDisposableTo(disposeBag)

        typeaheadCoordinator.didTapQueryPrediction
            .subscribe(onNext: { [unowned self] in
                self.typeaheadDidTapQueryPrediction()
            })
            .addDisposableTo(disposeBag)
    }

    // MARK: typeahead

    private func typeaheadDidTapEditSavedSearch() {

    }

    private func typeaheadDidTapQueryPrediction() {
        let fc = JobsListFlowController(interactor: interactor)

        let nav = UINavigationController(rootViewController: fc.viewController)
        viewController.present(nav, animated: true, completion: nil)

        jobsListFlowController = fc
    }

    // MARK: ?

}
