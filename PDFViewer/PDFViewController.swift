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
    var pdfdoc:CGPDFDocumentRef?
    var pdfvw: PDFView?
    var currentPage: UInt = 1
    var lastPage: UInt?
    var showNavi: Bool = false
    override func viewDidLoad() {
        pdfdoc = CGPDFDocumentCreateWithURL(pdfurl)
        pdfvw = PDFView(frame: UIScreen.mainScreen().bounds)
        pdfvw!.backgroundColor = UIColor.whiteColor()
        pdfvw!.pdfpage = CGPDFDocumentGetPage(pdfdoc, currentPage)
        self.view.addSubview(pdfvw!)
        
        var showNaviTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "showNaviBar:")
        pdfvw!.userInteractionEnabled = true
        pdfvw!.gestureRecognizers = [showNaviTap]

        lastPage = CGPDFDocumentGetNumberOfPages(pdfdoc)
        
        var preView = createTouchView()
        var preTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "goPrevPage:")
        preView.gestureRecognizers = [preTap]
        self.view.userInteractionEnabled = true
        self.view.addSubview(preView)
        
        var nextView = createTouchView()
        nextView.frame.origin.x = CGRectGetWidth(pdfvw!.frame) - CGRectGetWidth(nextView.frame)
        var nextTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "goNextPage:")
        nextView.gestureRecognizers = [nextTap]
        self.view.userInteractionEnabled = true
        self.view.addSubview(nextView)
    }
    
    func showNaviBar(sender: AnyObject!) {
        self.navigationController?.setNavigationBarHidden(showNavi, animated: true)
        showNavi = !showNavi
    }
    
    func goPrevPage(sender: AnyObject!) {
        if currentPage == 1 {
            return
        }
        
        currentPage -= 1
        pdfvw!.pdfpage = CGPDFDocumentGetPage(pdfdoc, currentPage)
    }

    
    func goNextPage(sender: AnyObject!) {
        if currentPage == lastPage {
            return
        }
            
        currentPage += 1
        pdfvw!.pdfpage = CGPDFDocumentGetPage(pdfdoc, currentPage)
    }
    
    func createTouchView() ->UIView {
        var width: CGFloat = CGRectGetWidth(pdfvw!.frame) / 4
        var view: UIView = UIView(frame: CGRectMake(0, 0, width, CGRectGetHeight(pdfvw!.frame)))
        view.backgroundColor = UIColor.clearColor()
        view.userInteractionEnabled = true
        return view
    }
}