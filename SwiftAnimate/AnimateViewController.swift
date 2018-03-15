
//
//  AnimateViewController.swift
//  SwiftAnimate
//
//  Created by Miaoz on 2018/1/17.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

import UIKit

class AnimateViewController: UIViewController {
    
    var buttonA = UIButton.init(frame: CGRect.init(x: 85, y: UIScreen.main.bounds.size.height, width: 300, height: 300))
    var buttonB = UIButton.init(frame: CGRect.init(x: 75, y: UIScreen.main.bounds.size.height, width: 300, height: 300))
    var bgView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
    
    var buttonC = UIButton.init(frame: CGRect.init(x: 90, y: UIScreen.main.bounds.size.height - 100, width: 200, height: 30))
    
    
    let imgv = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
   
    //懒加载转场
    private lazy var transitionAnimator: TransitionAnimator = {
       
        let transitionAnimator = TransitionAnimator()
        //在这里设置弹出菜单的位置和大小
        transitionAnimator.presentFrame = self.view.frame
        return transitionAnimator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgv.center = CGPoint.init(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
        imgv.backgroundColor = UIColor.cyan
        imgv.isHidden = true
//        imgv.layer.cornerRadius = 25
//        imgv.layer.shadowOpacity = 0.3
//        imgv.layer.shadowOffset = CGSize.init(width: 5, height: 5)
//        imgv.layer.masksToBounds = false
        
         imgv.layer.cornerRadius = 25
        imgv.layer.shadowColor = UIColor.black.cgColor
        imgv.layer.shadowOpacity = 0.3
        imgv.layer.shadowOffset = CGSize(width: 0, height: 0)
        imgv.layer.shadowRadius = 4
     
//        imgv.layer.masksToBounds = true
        self.view.addSubview(imgv)
    
        self.view.addSubview(self.bgView)
        
        self.buttonC.backgroundColor = UIColor.brown
        self.bgView.addSubview(self.buttonC)
        self.buttonC.addTarget(self, action: #selector(clickEventC), for: .touchUpInside)
        
        
        
        self.buttonA.center = CGPoint.init(x: self.view.center.x, y: UIScreen.main.bounds.size.height)
         self.buttonB.center = CGPoint.init(x: self.view.center.x, y: UIScreen.main.bounds.size.height + 50)

        self.buttonA.backgroundColor = UIColor.yellow
        self.buttonB.backgroundColor = UIColor.orange
        
        self.bgView.addSubview(self.buttonB)
        self.bgView.addSubview(self.buttonA)
        
        self.buttonA.layer.shadowColor = UIColor.black.cgColor
        self.buttonA.layer.shadowOpacity = 0.3
        self.buttonA.layer.shadowOffset = CGSize.init(width: 0, height: 15)
        self.buttonA.layer.cornerRadius = 5
        self.buttonA.layer.masksToBounds = false
        
        
        self.buttonB.layer.shadowColor = UIColor.black.cgColor
        self.buttonB.layer.shadowOpacity = 0.2
        self.buttonB.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        self.buttonB.layer.cornerRadius = 5
        self.buttonB.layer.masksToBounds = false
     
        
        self.buttonB.transform = CGAffineTransform.init(scaleX:0.9, y: 0.9)
        
       
         self.buttonA.addTarget(self, action: #selector(clickEvent), for: .touchUpInside)
        self.buttonB.addTarget(self, action: #selector(clickEvent), for: .touchUpInside)
        
      
        
        self.bgView.layer.removeAllAnimations()
        
        
        

//        let springAnimation = CASpringAnimation(keyPath: "position.y")
//        springAnimation.damping = 8         //阻尼系数 0 ~ 10
//        springAnimation.mass    = 1        //弹簧末端的质量 大于 0 质量越大弹性就越大
//        springAnimation.initialVelocity = 5 //速度
//        springAnimation.stiffness = 100;      //弹簧刚度系数 0 到 100 系数越大力就越大
//        springAnimation.fromValue =  -100 //起始的位置
//        springAnimation.toValue   =  bgView.layer.position.y  //结束位置
//        springAnimation.duration  =  springAnimation.settlingDuration //结束时间
//
//        bgView.layer.add(springAnimation, forKey:  springAnimation.keyPath)
//        //        这时候我们的简单的弹性动画就实现
//        //        动画结束后我们发现位置又恢复了以前的位置
//        //        加上下面两行代码就停止在我们改变的地方了
//        //
//        springAnimation.isRemovedOnCompletion = false
//        springAnimation.fillMode = kCAFillModeForwards
        
//        let springAnimation2 = CASpringAnimation(keyPath: "position.y")
//        springAnimation2.damping = 5         //阻尼系数 0 ~ 10
//        springAnimation2.mass    = 1        //弹簧末端的质量 大于 0 质量越大弹性就越大
//        springAnimation2.initialVelocity = 5 //速度
//        springAnimation2.stiffness = 100;      //弹簧刚度系数 0 到 100 系数越大力就越大
//        springAnimation2.fromValue =  -100 //起始的位置
//        springAnimation2.toValue   =  buttonB.layer.position.y  //结束位置
//        springAnimation2.duration  =  springAnimation2.settlingDuration //结束时间
//
//        buttonB.layer.add(springAnimation2, forKey:  springAnimation2.keyPath)
        
        //        这时候我们的简单的弹性动画就实现
        //        动画结束后我们发现位置又恢复了以前的位置
        //        加上下面两行代码就停止在我们改变的地方了
        //
//        springAnimation2.isRemovedOnCompletion = false
//        springAnimation2.fillMode = kCAFillModeForwards
//        let springAni = self.springAnimationWithPath("position.y", mass: 0.5, stiffness: 100.0, damping: 5.0, fromValue:   0, toValue: self.bgView.center.y)
//
//         self.bgView.layer.add(springAni, forKey: "positioin.y")

        UIView.animate(withDuration: 1.15) {
            self.buttonB.center = CGPoint.init(x: self.buttonB.center.x, y: self.view.center.y + 50)
            
            //                let springAni2 = self.springAnimationWithPath("position.y", mass: 0.5, stiffness: 100.0, damping: 7.0, fromValue:   0 , toValue: self.view.center.y + 50)
            //                springAni2.isRemovedOnCompletion = false
            //                springAni2.fillMode = kCAFillModeForwards
            //
            //                self.buttonB.layer.add(springAni2, forKey: "positioin.y")
            
        }
        UIView.animate(withDuration: 1) {
             self.buttonA.center = CGPoint.init(x: self.buttonA.center.x, y: self.view.center.y)
           
//            let springAni = self.springAnimationWithPath("position.y", mass: 0.5, stiffness: 100.0, damping: 9.0, fromValue:  0, toValue: self.view.center.y)
//            springAni.isRemovedOnCompletion = false
//            springAni.fillMode = kCAFillModeForwards
//
//            self.buttonA.layer.add(springAni, forKey: "positioin.y")
  
        }
        
        
        
       
     
        // Do any additional setup after loading the view.
    }

    @objc func clickEvent() {

        if self.buttonA.transform.a == 0.9 {
            UIView.animate(withDuration: 0.5, animations: {
                 self.bgView.bringSubview(toFront: self.buttonA)
                 self.buttonA.transform = CGAffineTransform.init(scaleX:1.0, y: 1.0)
                 self.buttonB.transform = CGAffineTransform.init(scaleX:0.9, y: 0.9)
                
                self.buttonA.layer.shadowOffset = CGSize.init(width: 0, height: 15)
                self.buttonB.layer.shadowOffset = CGSize.init(width: 0, height: 0)
            }, completion: { (_) in
//                self.buttonA.isEnabled = false
//                self.buttonB.isEnabled = true
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                 self.bgView.bringSubview(toFront: self.buttonB)
                self.buttonA.transform = CGAffineTransform.init(scaleX:0.9, y: 0.9)
                self.buttonB.transform = CGAffineTransform.init(scaleX:1.0, y: 1.0)
               
                self.buttonA.layer.shadowOffset = CGSize.init(width: 0, height: 0)
                self.buttonB.layer.shadowOffset = CGSize.init(width: 0, height: -15)
            }, completion: { (_) in
//                self.buttonA.isEnabled = true
//                self.buttonB.isEnabled = false
            })
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.bgView.isHidden = false
        self.imgv.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func springAnimationWithPath(_ path : String , mass : CGFloat , stiffness : CGFloat , damping : CGFloat , fromValue : Any? , toValue : Any) -> CASpringAnimation{
        let springAni = CASpringAnimation(keyPath: path)
        
        //质量：影响图层运动时的弹簧惯性，质量越大，弹簧的拉伸和压缩的幅度越大，动画的速度变慢，且波动幅度变大
        springAni.mass = mass
        
        //刚度：越大动画越快
        springAni.stiffness = stiffness
        
        //阻尼：越大停止越快
        springAni.damping = damping
        
        //初始速率
        springAni.initialVelocity = 0
        
        //初始值
        springAni.fromValue = fromValue
        
        //结束值
        springAni.toValue = toValue
        
        print("动画停止预估时间" + "\(springAni.settlingDuration)")
        
        springAni.duration = springAni.settlingDuration
        
        return springAni
    }

    
    @objc func clickEventC() {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.imgv.isHidden = false
            self.bgView.isHidden = true
        }) { (_) in
            
            //Scale
            let scaleAnimate = Animate.baseAnimationWithKeyPath("transform.scale", fromValue: nil, toValue: 2, duration: 0.3, repeatCount: Float.infinity, timingFunction: nil)
            scaleAnimate.autoreverses = true
            self.imgv.layer.add(scaleAnimate, forKey: "transform.scale")
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
             self.imgv.isHidden = true
             self.imgv.layer.removeAllAnimations()
            
            let viewController = MineViewController()

            //设置转场样式:自定义 自定义UIPresentationController可能需要
//            viewController.modalPresentationStyle = UIModalPresentationStyle.custom
            //动画弹出菜单
            self.present(viewController, animated: true, completion: nil)
            
            
            
            
   })
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
            
            self.bgView.isHidden = false
            self.imgv.isHidden = true
 })
        
       

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
