//
//  DetailViewController.swift
//  WetherApp
//
//  Created by Петр Постников on 29.06.2024.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
}

protocol DetailViewControllerProtocol: AnyObject {
    func displayDetail(viewModel: DetailDataFlow.PresentDetail.ViewModel)
}

final class DetailViewController: UIViewController {
    
    private let presenter: DetailPresenterProtocol
    private lazy var customView = self.view as? DetailView
    private let tableViewDataSource = DetailTableViewDataSource()
    private let tableViewDelegate = DetailTableViewDelegate()
    
    init(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = DetailView(frame: .zero,
                          tableViewDelegate: tableViewDelegate,
                          tableViewDataSource: tableViewDataSource,
                          delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.presentDetail(request: DetailDataFlow.PresentDetail.Request())
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    func displayDetail(viewModel: DetailDataFlow.PresentDetail.ViewModel) {
        tableViewDataSource.viewModel = viewModel.viewModel
        tableViewDelegate.viewModel = viewModel.viewModel
        DispatchQueue.main.async { [weak self] in
            self?.customView?.reloadDataTableView()
        }
    }
}

extension DetailViewController: DetailViewControllerDelegate {
    
}
