//
//  MenuTableView.swift
//  ArchitectureTest
//
//  Created by Kailash on 7/27/18.
//  Copyright © 2018 Kailash. All rights reserved.
//

import UIKit

class MenuTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var menuOptions = ["Profile","Chat","Terms & Conditions","Help"];

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style);
        print("intbl");
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: TableViewDelegateMethods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuTableViewCell(style: .default, reuseIdentifier: "MenuCell")
        cell.cellTitle.text = menuOptions[indexPath.row];
        print("incfr");
        return cell
    }
}
