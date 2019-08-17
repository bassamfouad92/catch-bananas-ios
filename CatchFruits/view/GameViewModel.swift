//
//  GameViewModel.swift
//  CatchFruits
//
//  Created by Apple on 17/08/2019.
//  Copyright © 2019 Bassam. All rights reserved.
//

import Foundation
import UIKit

class GameViewModel {
    
    var canvas : UIView? = nil
    var barrel : UIView? = nil
    var scoreLabel : UILabel!
    var bananas = [Fruit]()
    var bombs = [Bomb]()
    var score : Int = 0

    init(_ canvas : UIView, _ barrel: UIView,_ score : UILabel) {
        self.canvas = canvas
        self.scoreLabel = score
        self.barrel = barrel
    }
    
    public func initialBarrelPosition(_ barrelView : UIView){
        let bottomMax = canvas!.frame.maxY - 70
        let left = canvas!.frame.minX + 20
        barrelView.center = CGPoint(x: left + 30, y:bottomMax - 100)
    }
    
    public func generateBananas(_ view : UIView){
        
        for index in 1..<3 {
            let banana = Fruit(self.canvas!)
            bananas.append(banana)
            view.addSubview(banana.fruitImage!)
        }
        
    }
    
    public func generateBombs(_ view : UIView){
        
        for index in 1..<2 {
            let bomb = Bomb(self.canvas!)
            bombs.append(bomb)
            view.addSubview(bomb.bomb!)
        }
        
    }
    
    public func moveBananas(){
        
        for b in bananas {
            if let banana = b.fruitImage {
                banana.center = CGPoint(x:banana.center.x, y: banana.center.y + 10)
            }
        }
    }
    
    public func moveBombs(){
        
        for b in bombs {
            if let bomb = b.bomb {
                bomb.center = CGPoint(x:bomb.center.x, y: bomb.center.y + 30)
            }
        }
    }
    
    
    func removeSubview(_ tag : Int, _ view : UIView){
        if let viewWithTag = view.viewWithTag(tag) {
            viewWithTag.removeFromSuperview()
        }
    }
    
    func bananasIntercept(_ barrel : UIView, _ view : UIView){
        
        for b in bananas {
            if let banana = b.fruitImage {
                if (barrel.frame.intersects(banana.frame)) {
                    score = score + 1
                    removeSubview(banana.tag,view)
                }
            }
        }
        
        scoreLabel.text = "\(score)"
    }
    
    func bombsIntercept(_ barrel : UIView, _ view : UIView){
        
        for b in bombs {
            if let bomb = b.bomb {
                if (barrel.frame.intersects(bomb.frame)) {
                    Utils.playSound("bomb")
                    score = score - 10
                    resetScore()
                    removeSubview(bomb.tag,view)
                }
            }
        }
        
       scoreLabel.text = "\(score)"

    }
    
    func resetScore()
    {
        if(score < 10)
        {
            score = 0
        }
    }
    
    public func dragBarrel( _ recognizer : UIPanGestureRecognizer){
     
        let translation = recognizer.translation(in: self.canvas)

        if let view = recognizer.view {
            
            var barrelPos = CGPoint(x:view.center.x + translation.x,
                                    y:view.center.y + translation.y)
            
            let bottomMax = canvas!.frame.maxY - 70
            let right = canvas!.frame.maxX - 40
            let left = canvas!.frame.minX + 20
            
            if(barrelPos.y >= bottomMax)
            {
                barrelPos = CGPoint(x:barrelPos.x, y:bottomMax - 100)
            }
            
            if(barrelPos.x <= left)
            {
                barrelPos = CGPoint(x:barrelPos.x + 20, y:bottomMax - 100)
            }
            
            if(barrelPos.x >= right)
            {
                barrelPos = CGPoint(x:barrelPos.x - 30, y:bottomMax - 100)
            }
            
            if(barrelPos.y <= bottomMax)
            {
                barrelPos = CGPoint(x:barrelPos.x, y:bottomMax - 100)
            }
            
            view.center = barrelPos
            
        }
    }
}
