//
//  ViewController.swift
//  SwiftAnimate
//
//  Created by Miaoz on 2018/1/16.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
   let bigx = 85
    let bigy = 185
    let bigW = 100
    let bigH = 100
    
    let smallx = 75
    let smally = 150
    let smallW = 80
    let smallH = 80
    
    
    
    var flag = 0//flag作为一个标志，切换view时作为判断
    
     var button = UIButton.init(frame: CGRect.init(x: 0 , y: 0, width: 100, height: 100))
    
    var buttonA = UIButton.init(frame: CGRect.init(x: 85, y: 185, width: 80, height: 80))
    var buttonB = UIButton.init(frame: CGRect.init(x: 75, y: 150, width: 100, height: 100))
    
    var  bgView = UIView.init(frame: CGRect.init(x: 0, y: 100, width: UIScreen.main.bounds.size.width/2, height:  UIScreen.main.bounds.size.height/2))
    
    let datas : [String] = ["fade","moveIn","push","reveal","cube", "suckEffect", "rippleEffect", "pageCurl", "pageUnCurl", "oglFlip", "cameraIrisHollowOpen",  "cameraIrisHollowClose", "spewEffect","genieEffect","unGenieEffect","twist","tubey","swirl","charminUltra", "zoomyIn", "zoomyOut", "oglApplicationSuspend"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgView.backgroundColor = UIColor.yellow
        self.view.addSubview(bgView)
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(changeOrder3), for: .touchUpInside)
        self.view.addSubview(button)
        
        
        buttonA.backgroundColor = UIColor.blue
        buttonA.alpha = 1
        self.buttonA.layer.shadowColor = UIColor.black.cgColor
        self.buttonA.layer.shadowOpacity = 0
        self.buttonA.layer.shadowOffset = CGSize.init(width: 0, height: 4)
        self.bgView.addSubview(buttonA)
        
        buttonB.backgroundColor = UIColor.red
        buttonB.alpha = 1
        buttonB.layer.shadowColor = UIColor.black.cgColor
        buttonB.layer.shadowOpacity = 0.8
        buttonB.layer.shadowOffset = CGSize.init(width: 0, height: 4)
        self.bgView.addSubview(buttonB)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func transitionAnimationWith(duration : CFTimeInterval, type : String , subtype : String? , startProgress : Float , endProgress : Float) -> CATransition{
        let transitionAni = CATransition()
        
        //转场类型
        transitionAni.type = type
        
        /*
         kCATransitionFromTop       从顶部转场
         kCATransitionFromBottom    从底部转场
         kCATransitionFromLeft      从左边转场
         kCATransitionFromRight     从右边转场
         */
        transitionAni.subtype = subtype ?? kCATransitionFromLeft
        
        //动画开始的进度
        transitionAni.startProgress = startProgress
        
        //动画结束的进度
        transitionAni.endProgress = endProgress
        
        //动画的时间
        transitionAni.duration = duration
        
        return transitionAni
    }
    
    
    
    @objc func changeOrder3() {
        if flag == 0 {
            UIView.animate(withDuration: 1.0, animations: {
                 self.buttonB.transform.scaledBy(x: 1.5, y: 1.5)

//                self.buttonB.transform = CGAffineTransform.  CGAffineTransformScale(self.imageView.transform, 1.5 ,1.5)
//                self.buttonB.frame = CGRect.init(x:  85, y: 150, width: 80, height: 80)
//                self.buttonA.frame = CGRect.init(x: 75, y: 185, width: 100, height: 100)
                self.buttonA.layer.shadowOpacity = 0.8
                self.buttonB.layer.shadowOpacity = 0
                 self.bgView.bringSubview(toFront: self.buttonA)
            }, completion: { (_) in
                
            })
            
            
            flag = 1
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.buttonA.frame = CGRect.init(x:  85, y: 185, width: 80, height: 80)
                self.buttonB.frame = CGRect.init(x: 75, y: 150, width: 100, height: 100)
                self.buttonB.layer.shadowOpacity = 0.8
                self.buttonA.layer.shadowOpacity = 0
                self.bgView.bringSubview(toFront: self.buttonB)
            }, completion: { (_) in
                
            })
            
            flag = 0
        }
        
        
    }
    
    
    @objc func changeOrder() {
        
        if flag == 0 {
           let transitionAni =  self.transitionAnimationWith(duration: 1.2, type: datas[6], subtype: kCATransitionFromTop, startProgress: 0, endProgress: 1)

//            UIView.animate(withDuration: 0.5, animations: {
             self.bgView.bringSubview(toFront: self.buttonA)
                self.buttonB.frame = CGRect.init(x: 85, y: 185, width: 80, height: 80)
                self.buttonA.frame = CGRect.init(x: 75, y: 150, width: 100, height: 100)
//            }, completion: { (_) in
//
//            })


            self.buttonA.layer.shadowOpacity = 0.8
            self.buttonB.layer.shadowOpacity = 0

            self.bgView.layer.add(transitionAni, forKey: "transition")
//            self.buttonB.layer.add(transitionAni, forKey: "transition")
//            self.buttonA.layer.add(transitionAni, forKey: "transition")
//             let transitionAni2 =  self.transitionAnimationWith(duration: 0.75, type: datas[6], subtype: kCATransitionFromTop, startProgress: 0, endProgress: 1)
//
//            self.buttonA.layer.add(transitionAni2, forKey: "transition")
            flag = 1
        } else {
            let transitionAni =  self.transitionAnimationWith(duration: 1.2, type: datas[0], subtype: kCATransitionFromTop, startProgress: 0, endProgress: 1)
             self.bgView.bringSubview(toFront: self.buttonB)
            self.buttonB.frame = CGRect.init(x: 75, y: 150, width: 100, height: 100)
            self.buttonA.frame = CGRect.init(x: 85, y: 185, width: 80, height: 80)

            self.buttonA.layer.shadowOpacity = 0
            self.buttonB.layer.shadowOpacity = 0.8
//             self.bgView.layer.add(transitionAni, forKey: "transition")
            self.buttonB.layer.add(transitionAni, forKey: "transition")
            self.buttonA.layer.add(transitionAni, forKey: "transition")
            flag = 0

        }

//        if flag == 0 {//判断是不是第一次切换
////            UIView.animate(withDuration: 0.75, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
////                self.buttonB.frame = CGRect.init(x: 85, y: 185, width: 80, height: 80)
////                self.buttonA.frame = CGRect.init(x: 75, y: 150, width: 100, height: 100)
////            }, completion: { (_) in
////                  self.view.bringSubview(toFront: self.buttonA)
////            })
//
//            UIView.animate(withDuration: 0.75, animations: {
//                self.buttonB.frame = CGRect.init(x: 85, y: 185, width: 80, height: 80)
//                self.buttonA.frame = CGRect.init(x: 75, y: 150, width: 100, height: 100)
//                self.buttonA.layer.shadowOpacity = 0.8
//                self.buttonB.layer.shadowOpacity = 0
////                self.buttonB.alpha = 0.2;
//
//
////                self.view.bringSubview(toFront: self.buttonA)
////                 self.buttonB.center = CGPoint.init(x: self.buttonB.center.x + 100, y: self.buttonB.center.y)
//
//            }, completion: { (_) in
//                self.view.bringSubview(toFront: self.buttonA)
//                UIView.animate(withDuration: 0.5, animations: {
////                   self.buttonB.alpha = 1;
////                     self.buttonB.center = CGPoint.init(x: self.buttonB.center.x - 100, y: self.buttonB.center.y)
////                      self.buttonA.frame = CGRect.init(x: 75, y: 150, width: 100, height: 100)
////
//                }, completion: { (_) in
//
//                })
//            })
//
//            flag = 1//改变标志的值
//        } else {
//
//            UIView.animate(withDuration: 0.75, animations: {
//                self.buttonB.frame = CGRect.init(x: 75, y: 150, width: 100, height: 100)
//                self.buttonA.frame = CGRect.init(x: 85, y: 185, width: 80, height: 80)
//
//                self.buttonA.layer.shadowOpacity = 0
//                self.buttonB.layer.shadowOpacity = 0.8
//                UIView.animate(withDuration: 0, delay: 1, options: .curveLinear, animations: {
//                      self.view.bringSubview(toFront: self.buttonB)
//                }, completion: { (_) in
//
//                })
//
////                self.view.bringSubview(toFront: self.buttonB)
////                 self.buttonB.center = CGPoint.init(x: self.buttonB.center.x + 100, y: self.buttonB.center.y)
//            }, completion: { (_) in
//
//                UIView.animate(withDuration: 0.75, animations: {
////                     self.buttonB.center = CGPoint.init(x: self.buttonB.center.x - 100, y: self.buttonB.center.y)
//                }, completion: { (_) in
//
//                })
//            })
//
//            flag = 0//恢复标志的值
//        }
    }

    
    @objc func changeOrder2() {
        if flag == 0 {//判断是不是第一次切换
            //            UIView.animate(withDuration: 0.75, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            //                self.buttonB.frame = CGRect.init(x: 85, y: 185, width: 80, height: 80)
            //                self.buttonA.frame = CGRect.init(x: 75, y: 150, width: 100, height: 100)
            //            }, completion: { (_) in
            //                  self.view.bringSubview(toFront: self.buttonA)
            //            })
            
            
            UIView.animate(withDuration: 0.5, animations: {
               
                //                self.buttonA.frame = CGRect.init(x: 75, y: 150, width: 100, height: 100)
                
                //                self.view.bringSubview(toFront: self.buttonA)
                
              
                self.buttonA.center = CGPoint.init(x: self.buttonA.center.x, y: self.buttonA.center.y - 100)
                self.buttonA.layer.shadowOpacity = 0.8
                self.buttonB.layer.shadowOpacity = 0
               
            }, completion: { (_) in
               
                
                UIView.animate(withDuration: 0.55, animations: {
                    self.bgView.bringSubview(toFront: self.buttonA)
                      let transitionAni =  self.transitionAnimationWith(duration: 0.55, type: self.datas[9], subtype: kCATransitionFromBottom, startProgress: 0, endProgress: 1)
                    
                    self.buttonA.center = CGPoint.init(x: self.buttonA.center.x , y: self.buttonA.center.y + 100)
                    self.buttonA.frame = CGRect.init(x: 75, y: 150, width: 100, height: 100)
                    self.buttonB.frame = CGRect.init(x: 85, y: 185, width: 80, height: 80)
                    self.buttonA.layer.add(transitionAni, forKey: "transition")
                }, completion: { (_) in
                    
                })
            })
            flag = 1//改变标志的值
        } else {
            
            UIView.animate(withDuration: 0.5, animations: {
                
                //                self.buttonA.frame = CGRect.init(x: 75, y: 150, width: 100, height: 100)
                
                //                self.view.bringSubview(toFront: self.buttonA)
                
                
                self.buttonB.center = CGPoint.init(x: self.buttonB.center.x, y: self.buttonB.center.y - 100)
                self.buttonB.layer.shadowOpacity = 0.8
                self.buttonA.layer.shadowOpacity = 0
                
            }, completion: { (_) in
                
                
                UIView.animate(withDuration: 0.55, animations: {
                    self.bgView.bringSubview(toFront: self.buttonB)
                    let transitionAni =  self.transitionAnimationWith(duration: 0.55, type: self.datas[9], subtype: kCATransitionFromBottom, startProgress: 0, endProgress: 1)
                    self.buttonB.center = CGPoint.init(x: self.buttonB.center.x , y: self.buttonB.center.y + 100)
                    self.buttonB.frame = CGRect.init(x: 75, y: 150, width: 100, height: 100)
                    self.buttonA.frame = CGRect.init(x: 85, y: 185, width: 80, height: 80)
                    self.buttonB.layer.add(transitionAni, forKey: "transition")
                }, completion: { (_) in
                    
                })
            })
//            UIView.animate(withDuration: 0.75, animations: {
////                self.buttonB.frame = CGRect.init(x: 75, y: 150, width: 100, height: 100)
//                self.buttonA.frame = CGRect.init(x: 85, y: 185, width: 80, height: 80)
//
//                self.buttonA.center = CGPoint.init(x: self.buttonA.center.x + 100, y: self.buttonA.center.y)
//                //                self.view.bringSubview(toFront: self.buttonB)
//                //                 self.buttonB.center = CGPoint.init(x: self.buttonB.center.x + 100, y: self.buttonB.center.y)
//            }, completion: { (_) in
//                self.view.bringSubview(toFront: self.buttonB)
//                self.buttonA.layer.shadowOpacity = 0
//                self.buttonB.layer.shadowOpacity = 0.8
//                UIView.animate(withDuration: 0.75, animations: {
//                     self.buttonA.center = CGPoint.init(x: self.buttonA.center.x - 100, y: self.buttonA.center.y)
//                    self.buttonB.frame = CGRect.init(x: 75, y: 150, width: 100, height: 100)
//
//                }, completion: { (_) in
//
//                })
//            })
            
            flag = 0//恢复标志的值
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

