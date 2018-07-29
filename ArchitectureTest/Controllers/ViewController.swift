//
//  ViewController.swift
//  ArchitectureTest
//
//  Created by Kailash on 7/27/18.
//  Copyright © 2018 Kailash. All rights reserved.
//

import UIKit
import SafariServices
import MapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverControllerDelegate, MKMapViewDelegate{
    var menuView: MenuTableView?;
    var isMenuVisible = false;
    var menuOptions = Menu.menuType.all;
    var nextVC = NextViewController()
    var map: MKMapView?;
    @IBOutlet weak var ada: UIActivityIndicatorView!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    //MARK: View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        ada.hidesWhenStopped = true;
        initMenuTable()
        initMapView()
        self.view.bringSubview(toFront: ada);
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
//        let pop = UIPopoverController(contentViewController: self);
//        pop.delegate = self
//        pop.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1);
//        pop.present(from: sender, permittedArrowDirections: UIPopoverArrowDirection.any, animated: true);
       // self.present(pop, animated: true, completion: nil);
        var myLoc = MKPointAnnotation()
        myLoc.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(exactly: 40.754931)!, longitude: CLLocationDegrees(exactly: -73.984019)!)
        var myannotation = [MKPointAnnotation]()
        myannotation.append(myLoc);
        ada.stopAnimating();
        map?.showAnnotations(myannotation, animated: true);
        
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
    
    private func initMapView(){
        map = MKMapView(frame: self.view.bounds);
        map?.mapType = .standard;
        map?.delegate = self;
        self.view.addSubview(map!);
    }
    
    //MARK: TableViewDelegateMethods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuOptions.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.menuView?.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuTableViewCell
        cell.cellTitle.text = menuOptions[indexPath.row].rawValue;
        print("\(cell)");
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = menuOptions[indexPath.row];
        switch index {
        case Menu.menuType.Profile:
            initMenuNextVC(withTitle: index.rawValue);
        case Menu.menuType.Chat:
            initMenuNextVC(withTitle: index.rawValue);
        case Menu.menuType.Terms:
            initTermsVC(withTitle: index.rawValue);
        case Menu.menuType.Logout:
            initMenuNextVC(withTitle: index.rawValue);
        }
    }
}

