//
//  MenuTableViewCell.swift
//  ArchitectureTest
//
//  Created by Kailash on 7/27/18.
//  Copyright © 2018 Kailash. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!{
        didSet{
           
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        print("in cell");
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
