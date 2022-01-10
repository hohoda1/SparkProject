//
//  FourthViewController.swift
//  SparkProject
//
//  Created by 이대호 on 2021/12/27.
//

import UIKit
import Foundation

protocol TextData {
    func textDataUserDefaults(textData: String)
}

// MARK: - Class 글쓰기 페이지
class FourthViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    // UserDefaults
    let defaults = UserDefaults.standard
    
    var delegate: TextData?
    
    // MARK: - Date
    func getDateToString() -> String {
        let date = Date()
        let formatter = DateFormatter()
        // formatter.dateStyle = .medium // 날짜 표현 방법 선택 (.long, .medium, .short)
        formatter.dateFormat = "yyyy. MM. dd EEEE"
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        
        return formatter.string(from: date)
    }

    // MARK: - IBOutlet
    @IBOutlet var headTitle: UITextField!
    @IBOutlet var subTitle: UITextField!
    @IBOutlet var mainTextWrite: UITextView!
    @IBOutlet var checkDate: UILabel!
    
    // MARK: TextView Placeholder
    func placeholderSetting() {
        mainTextWrite.delegate = self
        mainTextWrite.text = "텍스트를 입력해 주세요"
        mainTextWrite.textColor = UIColor.lightGray
    }
    // 입력 받을 때
    func textViewDidBeginEditing(_ mainTextWrite: UITextView) {
        if mainTextWrite.textColor == UIColor.lightGray {
            mainTextWrite.text = nil
            mainTextWrite.textColor = UIColor.black
        }
    }
    // 텍스트뷰가 비었을 때
    func textViewDidEndEditing(_ mainTextWrite: UITextView) {
        if mainTextWrite.text.isEmpty {
            mainTextWrite.text = "텍스트를 입력해 주세요"
            mainTextWrite.textColor = UIColor.lightGray
        }
    }
    
    // MARK: - view
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        placeholderSetting()
        checkDate.text = getDateToString()
    }
    
    // MARK: IBAction
    @IBAction func doneBtn(_ sender: UIBarButtonItem) {
        defaults.set(headTitle.text, forKey: "headTitle")
        defaults.set(subTitle.text, forKey: "subTitle")
        defaults.set(mainTextWrite.text, forKey: "mainTextWrite")
        defaults.set(checkDate.text, forKey: "saveDate")
        
        // 뒤로가기
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func imageAppendBtn(_ sender: UIButton) {
    }
    
    @IBAction func moreBtn(_ sender: UIButton) {
    }
    
    @IBAction func boldBtn(_ sender: UIButton) {
    }
    
    @IBAction func alignBtn(_ sender: UIButton) {
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
