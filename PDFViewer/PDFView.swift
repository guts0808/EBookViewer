//
//  PDFView.swift
//  PDFViewer
//
//  Created by ksd on 2014. 9. 25..
//  Copyright (c) 2014년 ksd. All rights reserved.
//

import UIKit

class PDFView: UIView {
    var pdfpage: CGPDFPageRef? {
        didSet {
            self.setNeedsDisplayInRect(self.bounds)
            }
    }
    
    override func drawRect(rect: CGRect) {
        var context:CGContextRef = UIGraphicsGetCurrentContext()
        
        // adjust size
        CGContextScaleCTM(context, 1.0, -1.0)
        CGContextTranslateCTM(context, 0, -CGRectGetHeight(rect))
        
        // adjust scale
        var pdfRect:CGRect = CGPDFPageGetBoxRect(pdfpage, kCGPDFArtBox)
        CGContextScaleCTM(context, CGRectGetWidth(rect)/CGRectGetWidth(pdfRect), CGRectGetHeight(rect)/CGRectGetHeight(pdfRect))
        CGContextDrawPDFPage(context, pdfpage)
    }
}