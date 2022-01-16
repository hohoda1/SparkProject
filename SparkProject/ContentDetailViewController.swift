//
//  ThirdViewController.swift
//  SparkProject
//
//  Created by 이대호 on 2021/12/27.
//

import UIKit
import Foundation

class ContentDetailViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: SecondViewController Segue Push Data
    var bubble: Bubble?
    
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
        
        guard let bubble = bubble else {
            return
        }
        
        let headString = bubble.headTitle
        let keywordString = bubble.subTitle
        let mainTextContentString = bubble.mainTextWrite
        let dateDataString = bubble.checkDate

        headTitleView.text = headString
        subTitleView.text = keywordString
        mainTextView.text = mainTextContentString
        dateView.text = dateDataString
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
