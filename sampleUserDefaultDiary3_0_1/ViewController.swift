//
//  ViewController.swift
//  sampleUserDefaultDiary3_0_1
//
//  Created by Eriko Ichinohe on 2016/11/07.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    
    @IBOutlet weak var txtDate: UITextField!
    
    @IBOutlet weak var txtCategory: UITextField!
    
    @IBOutlet weak var txtDiary: UITextView!
    
    var diaryList = NSMutableArray()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryList = [["title":"title1","date":"2016-05-13","category":"cebu","diary":"日記1"],["title":"title2","date":"2016-05-14","category":"cebu","diary":"日記2"],["title":"title3","date":"2016-05-15","category":"cebu","diary":"日記3"]]
        
        //UserDefaultから保存した配列を取り出す
        var myDefault = UserDefaults.standard
        
        //UserDefaultを全削除する
        //        var appDomain:String = Bundle.main.bundleIdentifier!
        //        myDefault.removePersistentDomain(forName: appDomain)
        
        
        if (myDefault.object(forKey: "diaryList") != nil){
            //データを呼び出して
            diaryList = myDefault.object(forKey: "diaryList") as! NSMutableArray
        }
        
        print(diaryList)
    }

    @IBAction func tapSave(_ sender: UIButton) {
        //タイトル,日付,カテゴリー、日記を追加
        diaryList.add(["title":txtTitle.text!,"date":txtDate.text!,"category":txtCategory.text!,"diary":txtDiary.text!])
        
        print(diaryList)
        
        //UserDefaultに保存
        //ユーザーデフォルトを用意する
        var myDefault = UserDefaults.standard
        
        //データを書き込んで
        myDefault.set(diaryList, forKey: "diaryList")
        
        //即反映させる
        myDefault.synchronize()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

