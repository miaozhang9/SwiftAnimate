//
//  MineViewController.swift
//  SwiftAnimate
//
//  Created by Miaoz on 2018/1/17.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {
    lazy var transition : TransitionAnimator = {
        let trans = TransitionAnimator()
        
        trans.duration = 0.5
        
        return trans
    }()
    
    var buttonC = UIButton.init(frame: CGRect.init(x: 85, y: UIScreen.main.bounds.size.height - 100, width: 200, height: 30))
    var buttonD = UIButton.init(frame: CGRect.init(x: 85, y: UIScreen.main.bounds.size.height - 300, width: 200, height: 30))
    
     var bgView = UIView.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
    
    lazy var imageView = UIImageView.init(frame: CGRect.init(x: 85, y: 64, width: 120, height: 160))

    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        transitioningDelegate = transition
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         transitioningDelegate = transition

//        transitioningDelegate = transition
//        transition.transitionCallBackBlcok = {
//            [unowned self] (type) in
//            UIView.animate(withDuration: 0.5, animations: {
//                self.bgView.center = self.view.center
//            }) { (_) in
//                
//            }
//        }
        
        bgView.backgroundColor = UIColor.orange
        self.view.addSubview(bgView)
        
    
        imageView.center = CGPoint.init(x: self.bgView.center.x, y: 100)
        imageView.backgroundColor = UIColor.red
        bgView.addSubview(imageView)
        
        self.view.backgroundColor = UIColor.cyan
        // Do any additional setup after loading the view.
        self.buttonC.backgroundColor = UIColor.brown
        self.view.addSubview(self.buttonC)
        self.buttonC.addTarget(self, action: #selector(clickEventC), for: .touchUpInside)
        
        self.buttonD.backgroundColor = UIColor.brown
        self.view.addSubview(self.buttonD)
        self.buttonD.addTarget(self, action: #selector(clickEventD), for: .touchUpInside)
        
    }

    @objc func clickEventC() {
        dismiss(animated: true, completion: nil)
//        showGifViewWithLocalName(name: "仓鼠动画01.gif")

    }
    
    @objc func clickEventD() {
        //        dismiss(animated: false, completion: nil)
        showGifViewWithLocalName2(name: "仓鼠动画02.gif")
//        imageView.showGIFImageWithLocalName(name: "仓鼠动画02")
        //
        
    }
    
    
    
    func  showGifViewWithLocalName(name:String) {
      
        guard let path = Bundle.main.path(forResource: name, ofType: nil),
            let data = NSData(contentsOfFile: path),
            let imageSource = CGImageSourceCreateWithData(data, nil)
            else {
                return
                
        }
        
        var images = [UIImage]()
        for i in 0..<CGImageSourceGetCount(imageSource) {
            guard let cgImage = CGImageSourceCreateImageAtIndex(imageSource, i, nil) else { continue }
            let image = UIImage(cgImage: cgImage)
            i == 0 ? imageView.image = image : ()
            images.append(image)
        }
        
        imageView.animationImages = images
        imageView.animationDuration = 2
        imageView.animationRepeatCount = 1
        imageView.startAnimating()

        imageView.image = images.last
    }
    
    func  showGifViewWithLocalName2(name:String) {
        
        guard let path = Bundle.main.path(forResource: name, ofType: nil),
            let data = NSData(contentsOfFile: path),
            let imageSource = CGImageSourceCreateWithData(data, nil)
            else {
                return
                
        }
        
        var images = [UIImage]()
        for i in 0..<CGImageSourceGetCount(imageSource) {
            guard let cgImage = CGImageSourceCreateImageAtIndex(imageSource, i, nil) else { continue }
            let image = UIImage(cgImage: cgImage)
            i == 0 ? imageView.image = image : ()
            images.append(image)
        }
        //需要先赋值图片占位，否则的话动画走完会不显示
        imageView.image = images.last
        imageView.animationImages = images
        imageView.animationDuration = 2
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
        
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
