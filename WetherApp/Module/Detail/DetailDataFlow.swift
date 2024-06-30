//
//  DetailDataFlow.swift
//  WetherApp
//
//  Created by Петр Постников on 29.06.2024.
//

import Foundation

enum DetailDataFlow {
    enum PresentDetail {
        struct Request {}
        
        struct ViewModel {
            let viewModel: DetailViewModel
        }
    }
}
