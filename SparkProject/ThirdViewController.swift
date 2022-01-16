//
//  ThirdViewController.swift
//  SparkProject
//
//  Created by 이대호 on 2021/12/27.
//

import UIKit
import Foundation

class ThirdViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: SecondViewController Segue Push Data
    var naviPushData: Data?
    
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
        
        let bubbleHere = try! PropertyListDecoder().decode([Bubble].self, from: naviPushData!)
        
        let head = bubbleHere.map { $0 .headTitle }
        let keyword = bubbleHere.map { $0 .subTitle }
        let mainTextContent = bubbleHere.map { $0 .mainTextWrite }
        let dateData = bubbleHere.map { $0 .checkDate }
        
        let headString = head.joined()
        let keywordString = keyword.joined()
        let mainTextContentString = mainTextContent.joined()
        let dateDataString = dateData.joined()
        
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
