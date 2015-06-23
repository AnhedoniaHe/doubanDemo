//
//  ChannelController.swift
//  doubanFM
//
//  Created by Anhedonia on 15/6/14.
//  Copyright (c) 2015年 Anhedonia. All rights reserved.
//

import UIKit

class ChannelController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tabel: UITableView!//风格列表
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "douban")//获取被窝表示为douban的cell
        cell.textLabel?.text = "title \(indexPath.row)"//设置标题
        cell.detailTextLabel?.text = "detail \(indexPath.row)"//设置详情
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("选择了\(indexPath.row)行")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
