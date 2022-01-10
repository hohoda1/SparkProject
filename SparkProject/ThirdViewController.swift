//
//  ThirdViewController.swift
//  SparkProject
//
//  Created by 이대호 on 2021/12/27.
//

import UIKit
import Foundation

class ThirdViewController: UIViewController, UITextFieldDelegate {
    // UserDefaults
    let defaults = UserDefaults.standard
    
    // MARK: IBOutlet
    @IBOutlet var headTitleView: UILabel!
    @IBOutlet var subTitleView: UILabel!
    @IBOutlet var dateView: UILabel!
    @IBOutlet var mainTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        headTitleView.text = defaults.string(forKey: "headTitle")
        subTitleView.text = defaults.string(forKey: "subTitle")
        mainTextView.text = defaults.string(forKey: "mainTextWrite")
        dateView.text = defaults.string(forKey: "saveDate")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
