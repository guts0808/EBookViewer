//
//  ViewController.swift
//  EBookViewer
//
//  Created by ksd on 2014. 9. 25..
//  Copyright (c) 2014년 ksd. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func refreshButton(sender: AnyObject!) {
        println("refreshButton");
        var path: NSString = NSBundle.mainBundle().pathForResource("sample", ofType: "pdf")!
        var url: NSURL = NSURL.URLWithString(path)
        var ctlr: PDFViewController = PDFViewController()
        ctlr.pdfurl = NSBundle.mainBundle().URLForResource("sample.pdf", withExtension: nil)

        self.presentViewController(ctlr, animated: true, completion: nil)
    }

}

