//
//  JKHomeVC.swift
//  JKQuickApp-iOS
//
//  Created by Jacky Liang on 2021/11/20.
//

import Foundation
import UIKit
import Flutter

class JKHomeVC: JKBaseVC{
    
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        setupUI()
    }
    
    func setupUI() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.backgroundColor = .white;
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}


extension JKHomeVC : UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 10
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cellid = "JKHomeTableCell"
       var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
       if cell == nil {
           cell = JKHomeTableCell(style: .subtitle, reuseIdentifier: cellid)
       }
        if let homeCell = cell as? JKHomeTableCell {
            homeCell.infoLabel.text = "Flutter 工具\(indexPath.row+1)"
        }
      
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 64.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let flutterViewController = JKFlutterAdapter.shared.generatorFlutterVC(JKFlutterEventTestVC.self)
        navigationController?.pushViewController(flutterViewController, animated: true)
    }
}
