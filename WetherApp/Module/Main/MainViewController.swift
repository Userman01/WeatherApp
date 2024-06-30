//
//  MainViewController.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    
    func didSelectCell(lat: Double, lon: Double)
    
    func didRefreshControl()
}

protocol MainViewControllerProtocol: AnyObject {
    
    func displaySourcheResult(viewModel: MainDataFlow.SourcheResult.ViewModel)
    
    func displayFailure(viewModel: MainDataFlow.Failure.ViewModel)
}

final class MainViewController: UIViewController {
    
    private let presenter: MainPresenterProtocol
    private lazy var customView = self.view as? MainView
    private let tableViewDataSource = MainTableViewDataSource()
    private let tableViewDelegate = MainTableViewDelegate()
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        tableViewDelegate.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = MainView(frame: .zero,
                        tableViewDelegate: tableViewDelegate,
                        tableViewDataSource: tableViewDataSource,
                        delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
}

extension MainViewController: MainViewControllerProtocol {
    
    func displaySourcheResult(viewModel: MainDataFlow.SourcheResult.ViewModel) {
        tableViewDataSource.viewModel = viewModel.viewModel
        tableViewDelegate.viewModel = viewModel.viewModel
        DispatchQueue.main.async { [weak self] in
            self?.customView?.reloadDataTableView()
        }
    }
    
    func displayFailure(viewModel: MainDataFlow.Failure.ViewModel) {
        print(viewModel.errorMessage)
    }
}

// MARK: UISearchBarDelegate

extension MainViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        do {
            let text = try SeurcheTextValidate().validated(searchText)
            presenter.getSourcheResult(request: MainDataFlow.SourcheResult.Request(text: text))
        } catch let error {
            presenter.presentFailure(response: MainDataFlow.Failure.Response(error: error))
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

// MARK: MainViewControllerDelegate
extension MainViewController: MainViewControllerDelegate {
    func didRefreshControl() {
        
    }
    
    func didSelectCell(lat: Double, lon: Double) {
        presenter.getResultWeather(request: MainDataFlow.ResultWeather.Request(lat: lat, lon: lon))
    }
}
