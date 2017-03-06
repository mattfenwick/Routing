//
//  JobsListViewController.swift
//  Routing
//
//  Created by Matt Fenwick on 3/5/17.
//  Copyright © 2017 mf. All rights reserved.
//

import UIKit
import RxSwift

class JobsListViewController: UIViewController {

    // MARK: boilerplate

    private let cancelSubject = PublishSubject<Void>()
    private let showSaveSearchSubject = PublishSubject<Void>()
    private let showFiltersSubject = PublishSubject<Void>()
    private let showJobDetailSubject = PublishSubject<Void>()

    // MARK: output

    lazy private (set) var cancel: Observable<Void> = {
        return self.cancelSubject.asObservable()
    }()
    lazy private (set) var showSaveSearch: Observable<Void> = {
        return self.showSaveSearchSubject.asObservable()
    }()
    lazy private (set) var showFilters: Observable<Void> = {
        return self.showFiltersSubject.asObservable()
    }()
    lazy private (set) var showJobDetail: Observable<Void> = {
        return self.showJobDetailSubject.asObservable()
    }()

    // MARK: ui elements

    @IBOutlet private weak var showSaveSearchButton: UIButton!
    @IBOutlet private weak var showFiltersButton: UIButton!
    @IBOutlet private weak var showJobDetailButton: UIButton!

    // MARK: private

    private let disposeBag = DisposeBag()

    // MARK: init

    init() {
        super.init(nibName: "JobsListViewController", bundle: Bundle(for: JobsListViewController.self))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: view lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        navigationItem.leftBarButtonItem = cancelButton

        // boilerplate
        cancelButton.rx.tap
            .subscribe(cancelSubject)
            .addDisposableTo(disposeBag)
        
        showSaveSearchButton.rx.tap
            .subscribe(showSaveSearchSubject)
            .addDisposableTo(disposeBag)

        showFiltersButton.rx.tap
            .subscribe(showFiltersSubject)
            .addDisposableTo(disposeBag)

        showJobDetailButton.rx.tap
            .subscribe(showJobDetailSubject)
            .addDisposableTo(disposeBag)
    }
    
}
