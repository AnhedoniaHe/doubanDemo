//
//  HttpController.swift
//  doubanFM
//
//  Created by Anhedonia on 15/6/16.
//  Copyright (c) 2015年 Anhedonia. All rights reserved.
//

import UIKit

protocol HttpProtocol{
    func didRecieveResults(results:NSDictionary)//接受一个字典
}

class HttpController:NSObject{
    //定义一个可选代理
    var delegate:HttpProtocol?
    //定义一个方法来获取网络数据 接收参数为网址
    func onSearch(url:String){
        var nsUrl:NSURL=NSURL(string: url)!
        var request:NSURLRequest=NSURLRequest(URL: nsUrl)
        //异步获取数据
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response:NSURLResponse!,data:NSData!,error:NSError!)->Void in})//completionHandler这是个闭包！在接受数据之后执行 将json转为字典 然后将对应字段转化为字典的KEY。再通过HttpProtocol把东西传回去
        //日狗
        var jsonResult:NSDictionary=NSJSONSerialization.JSONObjectWithData(data?, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
        //数据丢回给代理
        self.delegate?.didRecieveResults(jsonResult)
    }
}
