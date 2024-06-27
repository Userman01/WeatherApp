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
    
    let presenter: MainPresenterProtocol
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
