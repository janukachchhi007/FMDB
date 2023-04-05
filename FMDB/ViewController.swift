//
//  ViewController.swift
//  FMDB
//
//  Created by R94 on 04/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var t1: UITextField!
    
    @IBOutlet weak var t2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        fmdbHelper.createFile()
    }

    @IBAction func saveButtonAction(_ sender: Any) {
        if let x = t1.text,let y = Int(x)
        {
            fmdbHelper.addData(id: y, name: t2.text ?? "")
        }
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        if let x = t1.text,let y = Int(x)
        {
            fmdbHelper.deleteData(id: y, name: t2.text ?? "")
        }
    }
    
    @IBAction func getButtonAction(_ sender: Any) {
        let naviget = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(naviget, animated: true)
    }
}

