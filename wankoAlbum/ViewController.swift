//
//  ViewController.swift
//  wankoAlbum
//
//  Created by 笹倉 一也 on 2018/06/09.
//  Copyright © 2018年 笹倉 一也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
     var sendImage:UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = sendImage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

