//
//  ViewController.swift
//  FontViewer
//
//  Created by 藤井陽介 on 2016/06/11.
//  Copyright © 2016年 touyou. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDelegate, NSTextFieldDelegate {
    @IBOutlet weak var fontCollectionView: NSCollectionView!
    @IBOutlet var sampleTextField: NSTextField!
    
    let fm = NSFontManager()
    var fontNames: [String] = []
    var fontSheetArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // load font list
        fontNames = fm.availableFontFamilies
        
        // set CollectionViewItem
        let itemPrototype = self.storyboard?.instantiateControllerWithIdentifier("cvi") as! NSCollectionViewItem
        fontCollectionView.itemPrototype = itemPrototype
        
        sampleTextField.delegate = self
        
        for number in 0 ..< fontNames.count {
            let sheet = FontSheet(text: "aAあア亜", number: number, size: 20.0)
            fontSheetArray.addObject(sheet)
        }
        
        fontCollectionView.content = fontSheetArray as [AnyObject]
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func controlTextDidEndEditing(obj: NSNotification) {
        let object = obj.object as! NSTextField
        
        // テキストを設定し直す
        fontSheetArray = NSMutableArray()
        var text = object.stringValue
        if text == "" {
            text = "aAあア亜"
        }
        
        for number in 0 ..< fontNames.count {
            let sheet = FontSheet(text: text, number: number, size: 20.0)
            fontSheetArray.addObject(sheet)
        }
        
        fontCollectionView.content = fontSheetArray as [AnyObject]
    }
}

