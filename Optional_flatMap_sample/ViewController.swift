//
//  ViewController.swift
//  Optional_flatMap_sample
//
//  Copyright © 2016年 kkkdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flatMapSample()
    }
    
    func flatMapSample() -> Void{
        //同梱のdata.jsonを適当なサーバー下に設置して下さい。
        let data:NSData? = NSURL(string:"http://localhost/data.json").flatMap{NSData(contentsOfURL: $0)}
        var jsonDic:NSDictionary?
        if let data_ = data {
            do{
                jsonDic = (try NSJSONSerialization.JSONObjectWithData(data_
                    , options: NSJSONReadingOptions.AllowFragments) as? NSDictionary)
            }catch{}
        }
        
        let val = jsonDic.flatMap{$0["foo"]}.flatMap{ $0["bar"] as? NSArray }?
            .flatMap{ $0["baz"]}.flatMap{$0["value"] as? String}
        if let val_ = val {
            print(val_)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
