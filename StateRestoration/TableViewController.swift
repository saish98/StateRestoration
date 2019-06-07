//
//  TableViewController.swift
//  StateRestoration
//
//  Created by saish chachad on 07/06/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.title = "Demo"
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        //Indian flag colours
        switch indexPath.row {
        case 1:
            cell.backgroundColor = UIColor.white
        case 2:
            cell.backgroundColor = UIColor.green
        default:
            cell.backgroundColor = UIColor.orange
        }

        return cell
    }
}
