//
//  SecondViewController.swift
//  SparkProject
//
//  Created by 이대호 on 2021/12/27.
//

import UIKit
import Foundation

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let defaults = UserDefaults.standard
    
    // Cell Array
    var cellList: [String] = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let img = UIImage(named: "\(cellList[indexPath.row]).jpg")
        cell.cellImgView?.image = img
        cell.cellLabel?.text = cellList[indexPath.row]
        return cell
    }
    
    // MARK: - override View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let bubbleData = defaults.data(forKey: "saveBubble")
        let bubbleHere = try! PropertyListDecoder().decode([Bubble].self, from: bubbleData!)
        let head = bubbleHere.map { $0 .headTitle }
        
        cellList.insert(contentsOf: head, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func btnWrite(_ sender: UIBarButtonItem) {
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ThirdViewController {
            let vc = segue.destination as! ThirdViewController
            vc.naviPushData = defaults.data(forKey: "saveBubble")
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }

}

// MARK: - CollectionViewCell CLASS
class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cellImgView: UIImageView!
    @IBOutlet var cellLabel: UILabel!
    
}
