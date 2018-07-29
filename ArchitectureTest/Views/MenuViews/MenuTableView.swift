//
//  MenuTableView.swift
//  ArchitectureTest
//
//  Created by Kailash on 7/27/18.
//  Copyright © 2018 Kailash. All rights reserved.
//

import UIKit

class MenuTableView: UITableView{
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var cell = MenuTableViewCell()
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
