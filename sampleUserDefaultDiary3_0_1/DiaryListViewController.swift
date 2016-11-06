//
//  DiaryListViewController.swift
//  sampleUserDefaultDiary3_0_1
//
//  Created by Eriko Ichinohe on 2016/11/07.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class DiaryListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var DiaryTableView: UITableView!
       var diaryListTmp = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    diaryListTmp = [["title":"title1","date":"2016-05-13","category":"cebu","diary":"日記1"],["title":"title2","date":"2016-05-14","category":"cebu","diary":"日記2"],["title":"title3","date":"2016-05-15","category":"cebu","diary":"日記3"]]

        //UserDefaultから保存した配列を取り出す
        var myDefault = UserDefaults.standard
        
        //        //UserDefaultを全削除する
        //        var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
        //        myDefault.removePersistentDomainForName(appDomain)
        
        if (myDefault.object(forKey: "diaryList") != nil){
            //データを呼び出して
            diaryListTmp = myDefault.object(forKey: "diaryList") as! NSMutableArray
        }
        
        print(diaryListTmp)

    }
    
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryListTmp.count
    }
    
    // 表示するセルの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        
        var oneDayData:NSDictionary = diaryListTmp[indexPath.row] as! NSDictionary
        
        var title:String = oneDayData["title"]! as! String
        
        //TODO:日付＋タイトルの書式で表示しましょう
        cell.textLabel!.text = "\(title)"
        
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
