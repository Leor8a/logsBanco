//
//  qrGeneratorViewController.swift
//  liga2.0
//
//  Created by Pedro Antonio Vazquez Rodriguez on 29/10/17.
//  Copyright © 2017 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class qrGeneratorViewController: UIViewController {

    @IBOutlet weak var qrImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        qrImageView.image = generateQRCode(from: random())
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
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    func random() -> String
    {
        let a = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        
        var s = ""
        
        for _ in 0..<15
        {
            let r = Int(arc4random_uniform(UInt32(a.characters.count)))
            
            s += String(a[a.index(a.startIndex, offsetBy: r)])
        }
        
        return s
    }

}
