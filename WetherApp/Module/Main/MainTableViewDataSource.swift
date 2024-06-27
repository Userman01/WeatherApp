//
//  MainDataSource.swift
//  WetherApp
//
//  Created by Петр Постников on 27.06.2024.
//

import UIKit

final class MainTableViewDataSource: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
