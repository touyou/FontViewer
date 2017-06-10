//
//  ViewController.swift
//  FontViewer
//
//  Created by 藤井陽介 on 2016/06/11.
//  Copyright © 2016年 touyou. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDelegate {
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
        let itemPrototype = self.storyboard?.instantiateController(withIdentifier: "cvi") as! NSCollectionViewItem
        fontCollectionView.itemPrototype = itemPrototype
        
        sampleTextField.delegate = self
        
        for number in 0 ..< fontNames.count {
            let sheet = FontSheet(text: "aAあア亜", number: number, size: 20.0)
            fontSheetArray.add(sheet)
        }
        
        fontCollectionView.content = fontSheetArray as [AnyObject]
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

extension ViewController: NSTextFieldDelegate  {
    override func controlTextDidEndEditing(_ obj: Notification) {
        let object = obj.object as! NSTextField
        
        // テキストを設定し直す
//        fontSheetArray = NSMutableArray()
        var text = object.stringValue
        if text == "" {
            text = "aAあア亜"
        }
        
        for i in 0 ..< fontSheetArray.count {
            (fontSheetArray[i] as! FontSheet).text = text
        }
        
//        for number in 0 ..< fontNames.count {
//            let sheet = FontSheet(text: text, number: number, size: 20.0)
//            fontSheetArray.add(sheet)
//        }
        
        fontCollectionView.content = fontSheetArray as! [Any]
        fontCollectionView.reloadData()
    }
}

