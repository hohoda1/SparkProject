//
//  SecondViewController.swift
//  SparkProject
//
//  Created by 이대호 on 2021/12/27.
//

import UIKit
import Foundation

class ContentListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let defaults = UserDefaults.standard
    @IBOutlet var collectionView: UICollectionView!
    
    // Cell Array
    var bubbleList: [Bubble] = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bubbleList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let index = indexPath.item
        let bubble = bubbleList[index]
        
        let img = UIImage(named: "\(bubble.headTitle).jpg")
        cell.cellImgView?.image = img
        cell.cellLabel?.text = bubble.headTitle
        return cell
    }
    
    // MARK: - override View
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let bubbleData = defaults.data(forKey: "saveBubble")
        let bubbleHere = try! PropertyListDecoder().decode([Bubble].self, from: bubbleData!)
        
        bubbleList.insert(contentsOf: bubbleHere, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func btnWrite(_ sender: UIBarButtonItem) {
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ContentDetailViewController {
            let cell = sender as! UICollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)
            
            guard let index = indexPath?.item else {
                return
            }
            let bubble = bubbleList[index]
            let vc = segue.destination as! ContentDetailViewController
            vc.bubble = bubble
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
