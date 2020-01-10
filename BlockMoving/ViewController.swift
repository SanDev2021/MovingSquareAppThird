//
//  ViewController.swift
//  BlockMoving
//
//  Created by SanDEV on 2020-01-06.
//  Copyright © 2020 SanDEV. All rights reserved.
//

import UIKit
//extension for randomize the colors of block
extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}

class ViewController: UIViewController {
    //view and label outlets
    @IBOutlet weak var viewLbl: UILabel!
    @IBOutlet weak var viewBox: UIView!

    //booleans for moving the block
    var BlockisClockwise = true
    var goToTop = false
    var goToBottom = false
    var goToLeft = false
    var goToRight = true
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    //timer for block label
    var timer:Timer?
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    //block speed timer
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.09,target: self,selector:#selector(moveView),userInfo: nil,repeats: true)
    }

    func stopTimer() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    //funtion for moving the block  clockwise
    @objc func moveView() {
        var xPosition = viewBox.frame.origin.x
        var yPosition = viewBox.frame.origin.y
        
        if BlockisClockwise {
            if xPosition > screenWidth - 70 {
                resetBools()
                goToBottom = true
            }
            if yPosition > screenHeight - 70 {
                resetBools()
                goToLeft = true
            }
            if goToLeft && xPosition < 20 {
                resetBools()
                goToTop = true
            }
            if goToTop && yPosition < 20 {
                resetBools()
                goToBottom = true
                BlockisClockwise = false
                viewBox.backgroundColor = .random
                counter += 1
                viewLbl.text = "\(counter)"
            }
            //anticlockwise
        } else {
            if goToBottom && yPosition > screenHeight - 70 {
                resetBools()
                goToRight = true
            }
            if goToRight && xPosition > screenWidth - 70 {
                resetBools()
                goToTop = true
            }
            if goToTop && yPosition < 20 {
                resetBools()
                goToLeft = true
            }
            if goToLeft && xPosition < 20 {
                resetBools()
                goToRight = true
                BlockisClockwise = true
                viewBox.backgroundColor = .random
                counter += 1
                viewLbl.text = "\(counter)"
            }
        }
        //speed for blck
        if goToBottom {
            yPosition += 10
        } else if goToTop {
            yPosition -= 10
        } else if goToLeft {
            xPosition -= 10
        } else if goToRight {
            xPosition += 10
        }
        //LOG
        print("x position \(xPosition)")
        print("y position \(yPosition)")
        
        let width = viewBox.frame.size.width
        let height = viewBox.frame.size.height
        self.viewBox.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        
    }
    //resetting all boolean values
    func resetBools() {
        goToTop = false
        goToBottom = false
        goToLeft = false
        goToRight = false
    }

}

