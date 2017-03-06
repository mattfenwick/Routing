//
//  MapViewController.swift
//  Routing
//
//  Created by Matt Fenwick on 3/5/17.
//  Copyright © 2017 mf. All rights reserved.
//

import UIKit
import RxSwift

class MapViewController: UIViewController {

    // MARK: boilerplate

    private let showTypeaheadSubject = PublishSubject<Void>()
    private let showCreateSavedSearchSubject = PublishSubject<Void>()
    private let showJobDetailsSubject = PublishSubject<Void>()
    private let showFiltersSubject = PublishSubject<Void>()

    // MARK: output

    lazy private (set) var showTypeahead: Observable<Void> = {
        return self.showTypeaheadSubject.asObservable()
    }()
    lazy private (set) var showCreateSavedSearch: Observable<Void> = {
        return self.showCreateSavedSearchSubject.asObservable()
    }()
    lazy private (set) var showJobDetails: Observable<Void> = {
        return self.showJobDetailsSubject.asObservable()
    }()
    lazy private (set) var showFilters: Observable<Void> = {
        return self.showFiltersSubject.asObservable()
    }()

    // MARK: ui elements

    @IBOutlet private weak var exitButton: UIButton! // TODO do we actually need this?
    @IBOutlet private weak var showTypeaheadButton: UIButton!
    @IBOutlet private weak var showCreateSavedSearchButton: UIButton!
    @IBOutlet private weak var showJobDetailsButton: UIButton!
    @IBOutlet private weak var showFiltersButton: UIButton!

    // MARK: private

    private let disposeBag = DisposeBag()

    // MARK: init

    init() {
        super.init(nibName: "MapViewController", bundle: Bundle(for: MapViewController.self))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: view lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // boilerplate
        showTypeaheadButton.rx.tap
            .subscribe(showTypeaheadSubject)
            .addDisposableTo(disposeBag)

        showCreateSavedSearchButton.rx.tap
            .subscribe(showCreateSavedSearchSubject)
            .addDisposableTo(disposeBag)

        showJobDetailsButton.rx.tap
            .subscribe(showJobDetailsSubject)
            .addDisposableTo(disposeBag)

        showFiltersButton.rx.tap
            .subscribe(showFiltersSubject)
            .addDisposableTo(disposeBag)
    }
    
}
