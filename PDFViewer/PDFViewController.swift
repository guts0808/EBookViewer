//
//  PDFViewController.swift
//  PDFViewer
//
//  Created by ksd on 2014. 9. 25..
//  Copyright (c) 2014년 ksd. All rights reserved.
//

import UIKit

class PDFViewController: UIViewController {
    var pdfurl: NSURL?
    override func viewDidLoad() {
        var pdfdoc:CGPDFDocumentRef? = CGPDFDocumentCreateWithURL(pdfurl)
        var pdfvw: PDFView = PDFView(frame: UIScreen.mainScreen().bounds)
        pdfvw.backgroundColor = UIColor.whiteColor()
        pdfvw.pdfpage = CGPDFDocumentGetPage(pdfdoc, 1)
        self.view.addSubview(pdfvw)
    }
}