//
//  BombModel.swift
//  CatchFruits
//
//  Created by Apple on 17/08/2019.
//  Copyright © 2019 Bassam. All rights reserved.
//

import Foundation
import UIKit

class Bomb {
    
    var bomb : UIImageView?
    
    init(_ canvas : UIView) {
        
        let canvasMaxX = canvas.frame.maxX - 30
        let canvasMinX = canvas.frame.minX
        let canvasMaxY = canvas.frame.maxY
        let canvasMinY = canvas.frame.minY
        
        let randomPosY = CGFloat.random(in: 50..<100) + 30.0
        let randomPosX = CGFloat.random(in: 50..<canvasMaxX)
        
        self.bomb = UIImageView(frame:CGRect(x:canvasMinX + randomPosX, y:canvasMinY + randomPosY, width:50, height:50))
        self.bomb!.image = UIImage(named:"bomb")
        self.bomb!.contentMode = .scaleAspectFit
        self.bomb!.tag = Int.random(in: 0..<1000)
    }
}
