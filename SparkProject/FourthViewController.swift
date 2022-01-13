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
        let headTitleText = headTitle.text
        let subTitleText = subTitle.text
        let mainTextWriteText = mainTextWrite.text
        let checkDateText = checkDate.text
        
        let bubble = Bubble(headTitle: headTitleText!, subTitle: subTitleText!, mainTextWrite: mainTextWriteText!, checkDate: checkDateText!)
        
        var bubblesArray: [Bubble] = []
        
        let bubbleDatas = defaults.data(forKey: "saveBubble")
        
        do {
            bubblesArray = try PropertyListDecoder().decode([Bubble].self, from: bubbleDatas!)
        } catch {
            
        }
        
        bubblesArray.append(bubble)
        
        let encodedBubble = try! PropertyListEncoder().encode(bubblesArray)
        defaults.set(encodedBubble, forKey: "saveBubble")
        
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
