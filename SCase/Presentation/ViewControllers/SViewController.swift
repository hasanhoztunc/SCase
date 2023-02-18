//
//  SViewController.swift
//  SCase
//
//  Created by Hasan Oztunc on 17.02.2023.
//

import UIKit

class SViewController<View: SView, ViewModel: SViewModel>: UIViewController {

    // MARK: - Internals

    var viewModel: ViewModel!
    var viewSource: View {
        self.view as! View
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        if self.viewModel == nil {
            self.viewModel = ViewModel()
        }

        self.viewModel.prepare()
    }

    override func loadView() {
        self.view = View()
    }
}
