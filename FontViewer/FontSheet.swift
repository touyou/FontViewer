//
//  FontSheet.swift
//  FontViewer
//
//  Created by 藤井陽介 on 2016/06/11.
//  Copyright © 2016年 touyou. All rights reserved.
//

import Cocoa
import Foundation

class FontSheet: NSObject {
    var text: String = ""
    var fontName: String = ""
    var font: NSFont = NSFont()
    
    init(text: String, number: Int, size: CGFloat) {
        self.text = text
        let fm = NSFontManager()
        let fontFamilies = fm.availableFontFamilies
        self.fontName = fontFamilies[number]
        self.font = NSFont(name: fontFamilies[number], size: size)!
        
        super.init()
    }
}