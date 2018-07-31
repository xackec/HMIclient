//
//  ViewController.swift
//  HMIclient
//
//  Created by Кирилл on 23.07.2018.
//  Copyright © 2018 dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var getRest: UIButton!
    var text:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func getRestClick(){
        guard let rest = RestController.make(urlString: "http://192.168.0.101:8080/greeting") else {
            print("Bad URL")
            return
        }
        
        rest.get(withDeserializer: JSONDeserializer()) { result, httpResponse in
            do {
                let json = try result.value()
               // print(json["content"].string) // "http://httpbin.org/get
                self.text = json["content"].string
            } catch {
                print("Error performing GET: \(error)")
            }
        }
        textField.text = text
    }

}

