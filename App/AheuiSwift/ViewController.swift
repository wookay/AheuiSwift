//
//  ViewController.swift
//  AheuiSwift
//
//  Created by wookyoung on 10/14/15.
//  Copyright © 2015 factorcat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var input :UITextView!
    @IBOutlet var output :UITextView!
    
    func textViewDidChange(textView: UITextView) {
        output.text = 아희(input.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        input.text =
            "밤밣따빠밣밟따뿌\n" +
            "빠맣파빨받밤뚜뭏\n" +
            "돋밬탕빠맣붏두붇\n" +
            "볻뫃박발뚷투뭏붖\n" +
            "뫃도뫃희멓뭏뭏붘\n" +
            "뫃봌토범더벌뿌뚜\n" +
            "뽑뽀멓멓더벓뻐뚠\n" +
            "뽀덩벐멓뻐덕더벅\n"
        output.text = 아희(input.text)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

