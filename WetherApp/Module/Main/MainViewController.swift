//
//  MainViewController.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import UIKit

protocol MainViewControllerProtocol {
    
}

final class MainViewController: UIViewController, MainViewControllerProtocol {
    
    private let presenter: MainPresenterProtocol
    private lazy var customView = self.view as? MainView
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = MainView(frame: .zero)
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

// MARK: UISearchBarDelegate

extension MainViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
