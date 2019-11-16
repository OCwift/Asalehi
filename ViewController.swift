//
//  ViewController.swift
//  NTest1 11.1.19
//
//  Created by Ardalan Salehi on 11/2/19.
//  Copyright © 2019 Ardalan, inc. All rights reserved.
//

import UIKit
//This is new Change
class ViewController: UIViewController {
    let DATA_KEY = "data_key"
    @IBOutlet weak var textView: UITextView!
    var pastedString : [String] = []
    override func viewDidLoad() {
        textView.text = "Hello!"
        if let loadedString = UserDefaults.standard.string(forKey:DATA_KEY ) {
            pastedString.append(loadedString)
        }
        showText()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func addText(){
        guard let text = UIPasteboard.general.string, !pastedString.contains(text) else{
            return
        }
        
        pastedString.append(text)
        UserDefaults.standard.set(pastedString, forKey: DATA_KEY)
        
        showText()
        
    }
    func showText(){
        textView.text = ""
        for str in pastedString {
            textView.text.append("\(str)\n\n")
        }
        
    }
    @IBAction func trashWasPressed(_ sender: Any) {
        pastedString.removeAll()
        textView.text = ""
        UserDefaults.standard.removeObject(forKey:DATA_KEY )
    }
    
}

