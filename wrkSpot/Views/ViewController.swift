//
//  ViewController.swift
//  wrkSpot
//
//  Created by Tarun Upadhyay on 21/03/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtnPressed(_ sender: UIButton) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CountryListVC") as! CountryListVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

