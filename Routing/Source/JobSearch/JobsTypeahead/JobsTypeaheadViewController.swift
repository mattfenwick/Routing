//
//  JobsTypeaheadViewController.swift
//  Routing
//
//  Created by Matt Fenwick on 3/5/17.
//  Copyright © 2017 mf. All rights reserved.
//

import UIKit
import RxSwift

class JobsTypeaheadViewController: UIViewController {

    // MARK: boilerplate

    private let didTapPredictionSubject = PublishSubject<Void>()
    private let didTapEditSavedSearchSubject = PublishSubject<Void>()
    private let didTapCancelSubject = PublishSubject<Void>()

    // MARK: output

    lazy private (set) var didTapPrediction: Observable<Void> = {
        return self.didTapPredictionSubject.asObservable()
    }()
    lazy private (set) var didTapEditSavedSearch: Observable<Void> = {
        return self.didTapEditSavedSearchSubject.asObservable()
    }()
    lazy private (set) var didTapCancel: Observable<Void> = {
        return self.didTapCancelSubject.asObservable()
    }()

    // MARK: ui elements

    @IBOutlet private weak var predictionButton: UIButton!
    @IBOutlet private weak var editSavedSearchButton: UIButton!

    // MARK: private

    private let disposeBag = DisposeBag()

    // MARK: init

    init() {
        super.init(nibName: "JobsTypeaheadViewController", bundle: Bundle(for: JobsTypeaheadViewController.self))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: view lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // nav bar
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        navigationItem.leftBarButtonItem = cancelButton

        // boilerplate
        predictionButton.rx.tap
            .subscribe(didTapPredictionSubject)
            .addDisposableTo(disposeBag)

        editSavedSearchButton.rx.tap
            .subscribe(didTapEditSavedSearchSubject)
            .addDisposableTo(disposeBag)

        cancelButton.rx.tap
            .subscribe(didTapCancelSubject)
            .addDisposableTo(disposeBag)
    }
    
}
