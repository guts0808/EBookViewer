//
//  ViewController.swift
//  EBookViewer
//
//  Created by ksd on 2014. 9. 25..
//  Copyright (c) 2014년 ksd. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var fileList: NSMutableArray = NSMutableArray()
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

        self.navigationController?.pushViewController(ctlr, animated: true)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var paths: NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        var documentsPath: String = String(paths[0] as NSString)
        var files: NSArray = NSFileManager.defaultManager().contentsOfDirectoryAtPath(
            documentsPath, error: nil)!
        
        for file in files {
            fileList.addObject(documentsPath.stringByAppendingPathComponent(file as NSString))
        }
        
        return files.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cellID", forIndexPath: indexPath) as UITableViewCell
        var filename: NSString? = fileList[indexPath.row] as? NSString
        cell.textLabel!.text = filename!.lastPathComponent
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var filename: String? = fileList[indexPath.row] as? String
        var ctlr: PDFViewController = PDFViewController()
        ctlr.pdfurl = NSURL(fileURLWithPath: filename!)
        self.navigationController?.pushViewController(ctlr, animated: true)
    }
}

