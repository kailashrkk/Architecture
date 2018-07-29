//
//  ViewController.swift
//  ArchitectureTest
//
//  Created by Kailash on 7/27/18.
//  Copyright © 2018 Kailash. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var menuView: MenuTableView?;
    var isMenuVisible = false;
    var menuOptions = ["Profile","Chat","Terms & Conditions","Help"];
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("in init");
        menuView = MenuTableView(frame: CGRect(x: -self.view.bounds.width/3, y: 0, width: self.view.bounds.width/3, height: self.view.bounds.height), style: UITableViewStyle.plain);
        self.menuView?.delegate = self;
        self.menuView?.dataSource = self;
        self.menuView?.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuCell");
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
                self.menuView?.frame = CGRect(x:0,y:0,width:self.view.bounds.width/3,height:self.view.bounds.height);
                self.view.addSubview(self.menuView!);
                self.isMenuVisible = true;
            }
        }else{
            UIView.animate(withDuration: 0.3) {
                self.menuView?.frame = CGRect(x:-self.view.bounds.width/3,y:0,width:self.view.bounds.width/3,height:self.view.bounds.height);
                self.menuView?.removeFromSuperview();
                self.isMenuVisible = false;
            }
        }
    }
    
    
    //MARK: TableViewDelegateMethods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuOptions.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.menuView?.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuTableViewCell
        cell.cellTitle.text = menuOptions[indexPath.row];
        cell.cellImage.image = #imageLiteral(resourceName: "nyc");
        print("\(cell)");
        return cell
    }
}

