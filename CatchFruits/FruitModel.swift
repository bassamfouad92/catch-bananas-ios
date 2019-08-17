//
//  FruitModel.swift
//  CatchFruits
//
//  Created by Apple on 17/08/2019.
//  Copyright © 2019 Bassam. All rights reserved.
//

import Foundation
import UIKit

public class Fruit {
    
    var fruitImage : UIImageView?
    
    init(_ canvas : UIView) {
        
        let canvasMaxX = canvas.frame.maxX - 30
        let canvasMinX = canvas.frame.minX
        let canvasMaxY = canvas.frame.maxY
        let canvasMinY = canvas.frame.minY
        
        let randomPosY = CGFloat.random(in: 50..<100) + 30.0
        let randomPosX = CGFloat.random(in: 50..<canvasMaxX)

        self.fruitImage = UIImageView(frame:CGRect(x:canvasMinX + randomPosX, y:canvasMinY + randomPosY, width:50, height:50))
        self.fruitImage!.image = UIImage(named:"banana")
        self.fruitImage!.contentMode = .scaleAspectFit
        self.fruitImage!.tag = Int.random(in: 0..<1000)
    }
}
