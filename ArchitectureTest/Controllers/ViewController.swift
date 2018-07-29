//
//  ViewController.swift
//  ArchitectureTest
//
//  Created by Kailash on 7/27/18.
//  Copyright © 2018 Kailash. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var menuView: MenuTableView?;
    var isMenuVisible = false;
    var menuOptions = ["Profile","Chat","Terms","Help"];
    var nextVC = NextViewController()
    @IBOutlet weak var ada: UIActivityIndicatorView!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    //MARK: View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initMenuTable()
        ada.startAnimating()
        //nextVC = NextViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: Storyboard Action Methods
    @IBAction func menuBtnTapped(_ sender: UIBarButtonItem) {
       toggleMenu()
    }
    
    @IBAction func searchBtnTapped(_ sender: UIBarButtonItem) {
    }
    //MARK: Private Methods
    private func toggleMenu(){
        if(!isMenuVisible){
            UIView.animate(withDuration: 0.3) {
                self.menuView?.frame = CGRect(x:0,y:0,width:self.view.bounds.width/3,height:self.view.bounds.height);
                self.view.addSubview(self.menuView!);
                self.menuView?.backgroundColor = #colorLiteral(red: 0, green: 0.9725490196, blue: 0.6862745098, alpha: 1);
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
    
    private func initMenuTable() {
        menuView = MenuTableView(frame: CGRect(x: -self.view.bounds.width/3, y: 0, width: self.view.bounds.width/3, height: self.view.bounds.height), style: UITableViewStyle.plain);
        self.menuView?.delegate = self;
        self.menuView?.dataSource = self;
        self.menuView?.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuCell");
        self.menuView?.tableFooterView = UIView(frame: .zero);
    }
    
    private func initMenuNextVC(withTitle title:String){
        nextVC.titleString = title;
        nextVC.title = title;
        UIView.animate(withDuration: 0.3) {
            self.navigationController?.pushViewController(self.nextVC, animated: true);
        }
    }
    
    private func initTermsVC(withTitle title:String){
        let sfvc = SFSafariViewController(url: URL(string:Constants.TERMS_URL)!);
        sfvc.title = "Terms & Conditions";
        self.present(sfvc, animated: true);
    }
    
    //MARK: TableViewDelegateMethods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuOptions.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.menuView?.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuTableViewCell
        cell.cellTitle.text = menuOptions[indexPath.row];
        print("\(cell)");
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = menuOptions[indexPath.row];
        switch index {
        case "Profile":
            initMenuNextVC(withTitle: index);
        case "Chat":
            initMenuNextVC(withTitle: index);
        case "Terms":
            initTermsVC(withTitle: index);
        case "Help":
            initMenuNextVC(withTitle: index);
        default:
            break;
        }
    }
}

