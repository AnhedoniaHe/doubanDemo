//
//  ViewController.swift
//  doubanFM
//
//  Created by Anhedonia on 15/6/14.
//  Copyright (c) 2015年 Anhedonia. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,HttpProtocol//若协议未被完整遵循，编译时则会报错
{
    var tableDate:NSArray=NSArray()
    var channelDate:NSArray=NSArray()
    func didRecieveResults(results: NSDictionary) {
        var eHttp:HttpController = HttpController()//继承父类 httpcontroller
        if (results["song"] != nil){
            self.tableDate=results["song"] as! NSArray
            self.table.reloadData()
            
            let firDict:NSDictionary=self.tableDate[0] as! NSDictionary
            let audioURL:String=firDict["url"] as! String
            println("音乐地址\(audioURL)")
            let imgUrl:String=firDict["picture"] as! String
            println("图片地址\(imgUrl)")
            
        }
    }
    @IBOutlet weak var image: UIImageView!//专辑图
    @IBOutlet weak var table: UITableView!//播放列表
    @IBOutlet weak var progress: UIProgressView!//进度条
    @IBOutlet weak var labelTime: UILabel!//时间
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDate.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "douban")
        //获取cell数据
        let rowDate:NSDictionary=self.tableDate[indexPath.row] as! NSDictionary
        cell.textLabel?.text = rowDate["title"] as? String
        cell.detailTextLabel?.text = rowDate["artist"] as? String
        let url=rowDate["picture"] as? String
        let imgURL:NSURL=NSURL(string: url!)!
        let request:NSURLRequest=NSURLRequest(URL: imgURL)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response:NSURLResponse!,data:NSData!,error:NSError!)->Void in
        let img=UIImage(data: data)
            cell.imageView?.image = img//*************6月21***************
        })
        cell.detailTextLabel?.text = "detail \(indexPath.row)"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("选择了\(indexPath.row)行")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        func didRecieveResults(results: NSDictionary) {
            var eHttp:HttpController = HttpController()//继承父类 httpcontroller
            eHttp.delegate=self
            eHttp.onSearch("http://douban.fm/j/mine/playlist?type=n&channel=0&from=mainsite")//*********这里！！！！*************
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

