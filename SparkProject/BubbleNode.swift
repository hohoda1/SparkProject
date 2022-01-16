//
//  BubbleNode.swift
//  SparkProject
//
//  Created by 이대호 on 2022/01/16.
//

import Foundation
import UIKit
import SpriteKit
import SIFloatingCollection

class BubbleNode: SIFloatingNode {
    var labelNode = SKLabelNode(fontNamed: "")
    
    var target: UIViewController?
    
    class func instantiate(keyword: String) -> BubbleNode {
        let node = BubbleNode(circleOfRadius: 30)
        configureNode(node)
        node.labelNode.text = keyword
        return node
    }
    
    class func configureNode(_ node: BubbleNode) {
        let boundingBox = node.path?.boundingBox;
        let radius = (boundingBox?.size.width)! / 2.0;
        node.physicsBody = SKPhysicsBody(circleOfRadius: radius + 1.5)
        node.fillColor = SKColor.black
        node.strokeColor = node.fillColor
        
        node.labelNode.text = "Hi"
        node.labelNode.position = CGPoint.zero
        node.labelNode.fontColor = SKColor.white
        node.labelNode.fontSize = 10
        node.labelNode.isUserInteractionEnabled = false
        node.labelNode.verticalAlignmentMode = .center
        node.labelNode.horizontalAlignmentMode = .center
        node.addChild(node.labelNode)
    }
    
    override func selectingAnimation() -> SKAction? {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let contentListVC = mainStoryBoard.instantiateViewController(withIdentifier: "ContentListViewController") as! ContentListViewController
        contentListVC.modalPresentationStyle = .fullScreen
        
        target?.navigationController?.pushViewController(contentListVC, animated: true)
        
        return SKAction.scale(to: 1, duration: 0.2)
    }
    
    override func normalizeAnimation() -> SKAction? {
        return SKAction.scale(to: 1, duration: 0.2)
    }
    
    override func removeAnimation() -> SKAction? {
        return SKAction.fadeOut(withDuration: 0.2)
    }
    
    override func removingAnimation() -> SKAction {
        let pulseUp = SKAction.scale(to: xScale + 0.13, duration: 0)
        let pulseDown = SKAction.scale(to: xScale, duration: 0.3)
        let pulse = SKAction.sequence([pulseUp, pulseDown])
        let repeatPulse = SKAction.repeatForever(pulse)
        return repeatPulse
    }
    
    func `throw`(to point: CGPoint, completion block: @escaping (() -> Void)) {
        removeAllActions()
        let movingXAction = SKAction.moveTo(x: point.x, duration: 0.2)
        let movingYAction = SKAction.moveTo(y: point.y, duration: 0.4)
        let resize = SKAction.scale(to: 0.3, duration: 0.4)
        let throwAction = SKAction.group([movingXAction, movingYAction, resize])
        run(throwAction, completion: block)
    }
}
