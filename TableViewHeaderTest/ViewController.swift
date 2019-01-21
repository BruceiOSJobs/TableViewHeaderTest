//
//  ViewController.swift
//  TableViewHeaderTest
//
//  Created by Bruce Chen on 2019/1/19.
//  Copyright © 2019 APP技術部-陳冠志. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

//    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .grouped)

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }

    func tableViewSetting() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadUI() {
        self.title = "TEST"
        tableViewSetting()
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 0
        }
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row) - HELLO"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 250
        }else {
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let header = UIView.init()
        header.backgroundColor = UIColor.gray
        
        if section == 0 {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "kanahei")
            header.addSubview(imageView)
            imageView.snp.makeConstraints { (make) in
                make.top.left.right.bottom.equalToSuperview()
            }
        } else {
            let label = UILabel()
            label.text = "Section: \(section)"
            header.addSubview(label)
            label.snp.makeConstraints { (make) in
                make.top.left.right.bottom.equalToSuperview()
            }
        }
        
        return header
    }
}
