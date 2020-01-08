//
//  ViewController.swift
//  BlockMoving
//
//  Created by SanDEV on 2020-01-06.
//  Copyright © 2020 SanDEV. All rights reserved.
//

import UIKit
class ViewController: UIViewController
{
@IBOutlet var myLabel: UILabel!
   
override func viewWillAppear(_ animated: Bool)
{
    myLabel.center.x -= view.bounds.width
}
override func viewDidLoad()
{
super.viewDidLoad()
UIView.animate(withDuration: 2.0)
{
   self.myLabel.center.x += self.view.bounds.width
}
    }
   func moveImage(_ myLabel: UILabel,_ speed:CGFloat) {
let speeds = speed
    let imageSpeed = speeds / view.frame.size.height

      let averageSpeed = (view.frame.size.width-myLabel.frame.origin.x) * imageSpeed

      UIView.animate(withDuration: TimeInterval(averageSpeed), delay: 0.0, options: .curveLinear, animations: {

      myLabel.frame.origin.y = self.view.frame.size.height

      }, completion: { (_) in

      myLabel.frame.origin.y = -myLabel.frame.size.height

      self.moveImage(myLabel,speeds)

      })

     }

       override func viewDidAppear(_ animated: Bool) {

           moveImage(myLabel, 20)

       }

   }

