//
//  ViewController.swift
//  KeyChainShareApp1
//
//  Created by Ashwin Ganesh on 4/15/19.
//  Copyright © 2019 Arwin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField?
    let keychainAccessGroupName = "ZY26UYFWUF.arwinKeyChainShareGroup1"
    let itemKey = "InputAttribute1"
    
    @IBAction func saveData(sender: UIButton) {
        
        guard let valueData = inputTextField?.text?.data(using: String.Encoding.utf8) else {
            print("Error saving text to Keychain")
            return
        }
        
        let queryAdd: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: itemKey as AnyObject,
            kSecValueData as String: valueData as AnyObject,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked,
            kSecAttrAccessGroup as String: keychainAccessGroupName as AnyObject
        ]
        
        let resultCode = SecItemAdd(queryAdd as CFDictionary, nil)
        
        if resultCode != noErr {
            print("Error saving to Keychain: \(resultCode)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

