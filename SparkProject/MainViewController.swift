//
//  ViewController.swift
//  SparkProject
//
//  Created by 이대호 on 2021/12/27.
//

import UIKit
import SpriteKit
import SIFloatingCollection

class MainViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    fileprivate var skView: SKView!
    fileprivate var floatingCollectionScene: BubblesScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skView = SKView(frame: UIScreen.main.bounds)
        skView.backgroundColor = SKColor.white
        view.addSubview(skView)
        
        floatingCollectionScene = BubblesScene(size: skView.bounds.size)
        let navBarHeight = navigationController!.navigationBar.frame.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        floatingCollectionScene.topOffset = navBarHeight + statusBarHeight
        skView.presentScene(floatingCollectionScene)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(clickWrite(_:))
        )
        
        setBubbleKeyword()
        
        
    }
    
    func setBubbleKeyword() {
        var keywords: [String] = []
        if let keywordArray = defaults.value(forKey: "Keywords") as? [String] {
            keywords = keywordArray
        }
        for keyword in keywords {
            addBubble(keyword: keyword)
        }
    }
    
    @objc func addBubble(keyword: String) {
        let newNode = BubbleNode.instantiate(keyword: keyword)
        newNode.target = self
        floatingCollectionScene.addChild(newNode)
    }
    
    // View change
    @objc func clickWrite(_ sender: Any) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let writeContentVC = mainStoryBoard.instantiateViewController(withIdentifier: "WriteContentViewController") as! WriteContentViewController
        writeContentVC.modalPresentationStyle = .fullScreen
        
        writeContentVC.doneWrite = { [weak self] keyword in
            self?.addBubble(keyword: keyword)
        }
        
        navigationController?.pushViewController(writeContentVC, animated: true)
    }
    
    @IBAction func btnWrite(_ sender: UIButton) {
        
    }
}

