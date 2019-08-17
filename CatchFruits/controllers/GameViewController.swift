//
//  GameViewController.swift
//  CatchFruits
//
//  Created by Apple on 17/08/2019.
//  Copyright © 2019 Bassam. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var barrelObject: UIView!
    
    @IBOutlet weak var canvasView: UIView!
    
    var gameViewModel : GameViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UIPanGestureRecognizer(target: self, action: #selector(self.handleBarrelDrag(_:)))
        barrelObject.addGestureRecognizer(tap)

        gameViewModel = GameViewModel(canvasView,barrelObject,scoreLabel) //initialize game view model
       // gameViewModel!.initialBarrelPosition(self.barrelObject) //barrel initial position
        
        let fruitTimer = Timer.scheduledTimer(timeInterval:2, target: self, selector: #selector(self.generateBananas), userInfo: nil, repeats: true)

        let moveTimer = Timer.scheduledTimer(timeInterval:0.1, target: self, selector: #selector(self.moveBanana), userInfo: nil, repeats: true)
        
       // let bombTimer = Timer.scheduledTimer(timeInterval:4, target: self, selector: #selector(self.generateBombs), userInfo: nil, repeats: true)
        
      //  let moveBombTimer = Timer.scheduledTimer(timeInterval:0.1, target: self, selector: #selector(self.moveBombs), userInfo: nil, repeats: true)

        //Generate initial bananas
        gameViewModel!.generateBananas(self.view)
       // gameViewModel!.generateBombs(self.view)

    }
    
    @objc func generateBananas() {
        gameViewModel!.generateBananas(self.view)
    }
    
    @objc func moveBanana() {
         gameViewModel!.moveBananas()
         gameViewModel!.bananasIntercept(barrelObject,self.view)
    }

    @objc func generateBombs() {
      //  gameViewModel!.generateBombs(self.view)
            }
    
    @objc func moveBombs() {
        gameViewModel!.moveBombs()
        gameViewModel!.bombsIntercept(barrelObject,self.view)
    }
    
    @objc func handleBarrelDrag(_ recognizer: UIPanGestureRecognizer) {
        
         gameViewModel!.dragBarrel(recognizer)
         recognizer.setTranslation(CGPoint.zero, in:gameViewModel!.canvas!)
         gameViewModel!.bananasIntercept(barrelObject,self.view)
        // gameViewModel!.bombsIntercept(barrelObject,self.view)


    }
    
    

}
