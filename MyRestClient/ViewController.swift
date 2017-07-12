//
//  ViewController.swift
//  MyRestClient
//
//  Created by Eliseo_Martinez on 7/8/17.
//  Copyright © 2017 berufs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ParseData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func ParseData(){
        //setting my url point
        let url = "https://restcountries.eu/rest/v1/all"
        
        //creating request variable
        var request = URLRequest(url: URL(string: url)!)
        
        //settingg my request method
        request.httpMethod = "GET"
        
        //building my default configuration
        let configuration = URLSessionConfiguration.default
        let sesion = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        //getting my session data by a task method
        let task = sesion.dataTask(with: request) {
            (data, response, error) in
            if error != nil{
                print("error")
            }
            else
            {
                do
                {
                    //saving all my json object in a local variable
                    let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                    
                    print("-------")
                    print("------ getting data ---------")
                    print("-------")
                    
                    print(fetchedData)
                    
                    print("-------")
                    print("------ Ending data ---------")
                    print("-------")
                }
                catch
                {
                    print("Error 2")
                }
            }
        }
        
        task.resume()
    }
}

