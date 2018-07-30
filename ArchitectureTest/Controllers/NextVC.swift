//
//  NextVC.swift
//  ArchitectureTest
//
//  Created by Kailash on 7/29/18.
//  Copyright © 2018 Kailash. All rights reserved.
//

import Foundation
import UIKit

class NextViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var titleString: String {
        get{
            return ""
        }
        set{
            setupLabel()
            label?.text = newValue;
        }
    }
    
    var tableView : UITableView?
    
    var apiClient: APIClient!
    
    var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
        self.setupLabel()
        tableView = UITableView(frame: self.view.bounds);
        self.tableView?.delegate = self;
        self.tableView?.dataSource = self;
    }
    
    private func setupLabel(){
        let label = UILabel(frame: self.view.bounds);
        label.center = self.view.center;
//        label.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true;
//        label.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true;
        label.heightAnchor.constraint(equalToConstant: 80.0).isActive = true;
        self.view.addSubview(label);
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! UITableViewCell;
        configureCell()
        return cell;
    }
    
    private func configureCell(){
        apiClient.fetchMovies { movies in
            print(movies);
        }
    }
    
}
