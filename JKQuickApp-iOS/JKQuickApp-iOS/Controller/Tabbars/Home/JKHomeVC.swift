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
    var hitCount = 0
    
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
            switch indexPath.row {
            case 0:
                homeCell.infoLabel.text = "Flutter&原生消息通信[带页面缓存]"
                break
            case 1:
                homeCell.infoLabel.text = "Flutter&原生消息通信[不带页面缓存]"
                break
            case 2:
                homeCell.infoLabel.text = "Flutter-Tabbar页面"
                break
            case 3:
                homeCell.infoLabel.text = "Flutter主页"
                break
            default:
                homeCell.infoLabel.text = "Flutter 工具\(indexPath.row+1)"
            }
            
        }
      
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 64.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            if let vc = JKFlutterAdapter.shared.getFlutterVC(pageId: "/test_channel", listenMessageChannels: ["hitCount"], listenMessageCallResponse: { [weak self] (call, result) in
                if call.method == "hitCount" {
                    self?.hitCount += 1
                    result(self?.hitCount)
                }
            }) {
                navigationController?.pushViewController(vc, animated: true)
            }
            break
        case 1:
            if let vc = JKFlutterAdapter.shared.getFlutterVC(pageId: "/test_channel", pageCache: false, listenMessageChannels: ["hitCount"], listenMessageCallResponse: { [weak self] (call, result) in
                if call.method == "hitCount" {
                    self?.hitCount += 1
                    result(self?.hitCount)
                }
            }) {
                navigationController?.pushViewController(vc, animated: true)
            }
            break
        case 2:
            if let vc = JKFlutterAdapter.shared.getFlutterVC(pageId: "/tarbar") {
                navigationController?.pushViewController(vc, animated: true)
            }
            break
        case 3:
            if let vc = JKFlutterAdapter.shared.getFlutterVC(pageId: "/home") {
                navigationController?.pushViewController(vc, animated: true)
            }
            break
        default:
            if let vc = JKFlutterAdapter.shared.getFlutterVC(pageId: "/placeholder") {
                navigationController?.pushViewController(vc, animated: true)
            }
           print("unknow do")
        }
        
         
    }
}
