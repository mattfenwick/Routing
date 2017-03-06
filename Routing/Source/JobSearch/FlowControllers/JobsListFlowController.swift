//
//  JobsListFlowController.swift
//  Routing
//
//  Created by Matt Fenwick on 3/6/17.
//  Copyright © 2017 mf. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

protocol JobsListFlowControllerInteractor: JobsListInteractor {
    func isAuthenticated() -> Bool

    func login() -> JobSearchLoginProtocol
}

class JobsListFlowController {

    let viewController: JobsListViewController
    let cancel: Observable<Void>

    private let jobsListCoordinator: JobsListCoordinator

    private var createSavedSearchCoordinator: CreateSavedSearchCoordinator? = nil

    private let disposeBag = DisposeBag()

    private let interactor: JobsListFlowControllerInteractor

    private var login: JobSearchLoginProtocol? = nil

    // TODO this interactor type is pretty lazy
    init(interactor: JobsListFlowControllerInteractor) {
        jobsListCoordinator = JobsListCoordinator(interactor: interactor)
        viewController = jobsListCoordinator.viewController

        self.interactor = interactor

        cancel = jobsListCoordinator.didTapCancel

        jobsListCoordinator.didTapJob
            .subscribe(onNext: { [unowned self] in

            })
            .addDisposableTo(disposeBag)
        
        jobsListCoordinator.didTapSaveSearch
            .subscribe(onNext: { [unowned self] in
                self.didTapSaveSearch()
            })
            .addDisposableTo(disposeBag)
        
        jobsListCoordinator.didTapShowFilters
            .subscribe(onNext: { [unowned self] in

            })
            .addDisposableTo(disposeBag)
    }

    private func didTapSaveSearch() {
        if interactor.isAuthenticated() {
            showSavedSearch()
        } else {
            let login = interactor.login()
            login.didCancelLogin
                .subscribe(onNext: { [unowned self] in
                    self.loginDidCancel()
                })
                .addDisposableTo(disposeBag)
            login.loginDidFail
                .subscribe(onNext: { [unowned self] in
                    self.loginDidFail()
                })
                .addDisposableTo(disposeBag)
            login.loginDidSucceed
                .subscribe(onNext: { [unowned self] username in
                    self.loginDidSucceed(username: username)
                })
                .addDisposableTo(disposeBag)
            let vc = UINavigationController(rootViewController: login.loginViewController)
            viewController.present(vc, animated: true, completion: nil)
            self.login = login
        }
    }

    private func showSavedSearch() {
        let coordinator = CreateSavedSearchCoordinator()

        coordinator.cancel
            .subscribe(onNext: { [unowned self] in
                self.savedSearchDidCancel()
            })
            .addDisposableTo(disposeBag)

        coordinator.delete
            .subscribe(onNext: { [unowned self] in
                self.savedSearchDidDelete()
            })
            .addDisposableTo(disposeBag)

        coordinator.save
            .subscribe(onNext: { [unowned self] in
                self.savedSearchDidSave()
            })
            .addDisposableTo(disposeBag)

        let nav = UINavigationController(rootViewController: coordinator.viewController)
        viewController.present(nav, animated: true, completion: nil)
        createSavedSearchCoordinator = coordinator
    }

    // MARK: login

    private func loginDidCancel() {
        viewController.dismiss(animated: true, completion: nil)
        self.login = nil
    }

    private func loginDidFail() {
        viewController.dismiss(animated: true, completion: nil)
        self.login = nil
    }
    
    private func loginDidSucceed(username: String) {
        viewController.dismiss(animated: true, completion: nil)
        self.login = nil
        showSavedSearch()
    }

    // MARK: saved search

    private func savedSearchDidCancel() {
        viewController.dismiss(animated: true, completion: nil)
        createSavedSearchCoordinator = nil
    }
    
    private func savedSearchDidSave() {
        viewController.dismiss(animated: true, completion: nil)
        createSavedSearchCoordinator = nil
    }
    
    private func savedSearchDidDelete() {
        viewController.dismiss(animated: true, completion: nil)
        createSavedSearchCoordinator = nil
    }
    
}
