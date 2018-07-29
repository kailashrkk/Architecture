//
//  NextVC.swift
//  ArchitectureTest
//
//  Created by Kailash on 7/29/18.
//  Copyright © 2018 Kailash. All rights reserved.
//

import Foundation
import UIKit

class NextViewController: UIViewController{
    
    var titleString: String {
        get{
            return ""
        }
        set{
            setupLabel()
            label?.text = newValue;
        }
    }
    
    var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
        self.setupLabel()
    }
    
    private func setupLabel(){
        let label = UILabel(frame: self.view.bounds);
        label.center = self.view.center;
//        label.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true;
//        label.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true;
        label.heightAnchor.constraint(equalToConstant: 80.0).isActive = true;
        self.view.addSubview(label);
    }
    
}
