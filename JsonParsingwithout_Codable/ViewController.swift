//
//  ViewController.swift
//  JsonParsingwithout_Codable
//
//  Created by Rahul Anantulwar on 10/17/18.
//  Copyright © 2018 Rahul Anantulwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        readJsonData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func readJsonData() {
        //let jsonData: [String:AnyObject] = [:]
        guard let jsonDataPath: String = Bundle.main.path(forResource: "sample", ofType: "json") else{return}
        print(jsonDataPath)
        let url = URL(fileURLWithPath: jsonDataPath)
        do {
            let data = try Data(contentsOf: url)
            print(data)
            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            print(jsonResponse)
            guard let jsonArray = jsonResponse as? [[String:Any]] else {return}
            //guard let jsonArray = jsonArray1 as? [[String:Any]] else {return}
            print(jsonArray)
            print("All json file titles are : - ")
            for dic in jsonArray{
                guard let title = dic["title"] as? String else { return }
                print(title) //Output
            }
        }catch{
            print(error)
        }
        //        print(jsonData)
    }

}

