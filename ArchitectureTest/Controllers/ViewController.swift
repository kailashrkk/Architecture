//
//  ViewController.swift
//  ArchitectureTest
//
//  Created by Kailash on 7/27/18.
//  Copyright © 2018 Kailash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var menuView: MenuTableView = MenuTableView();
    var isMenuVisible = false;
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("in init");
        menuView = MenuTableView(frame: CGRect(x: -self.view.bounds.width/3, y: 0, width: self.view.bounds.width/3, height: self.view.bounds.height), style: UITableViewStyle.plain);
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func menuBtnTapped(_ sender: UIBarButtonItem) {
       toggleMenu()
    }
    
    @IBAction func searchBtnTapped(_ sender: UIBarButtonItem) {
    }
    
    private func toggleMenu(){
        if(!isMenuVisible){
            UIView.animate(withDuration: 0.3) {
                self.menuView.frame = CGRect(x:0,y:0,width:self.view.bounds.width/3,height:self.view.bounds.height);
                self.view.addSubview(self.menuView);
                self.isMenuVisible = true;
            }
        }else{
            UIView.animate(withDuration: 0.3) {
                self.menuView.frame = CGRect(x:-self.view.bounds.width/3,y:0,width:self.view.bounds.width/3,height:self.view.bounds.height);
                self.menuView.removeFromSuperview();
                self.isMenuVisible = false;
            }
        }
    }
    
}

