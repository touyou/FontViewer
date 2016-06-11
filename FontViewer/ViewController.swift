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
    
    let fm = NSFontManager()
    var fontNames: [String] = []
    var fontSheetArray = NSMutableArray()
    
    override func viewDidLoad() {
        // super.viewDidLoad()

        // Do any additional setup after loading the view.
        // load font list
        fontNames = fm.availableFontFamilies
        
        // set CollectionViewItem
        let itemPrototype = self.storyboard?.instantiateControllerWithIdentifier("cvi") as! NSCollectionViewItem
        fontCollectionView.itemPrototype = itemPrototype
        
        print(fontNames.count)
        
        for number in 0 ..< fontNames.count {
            let sheet = FontSheet(text: "aAあア亜", number: number, size: 20.0)
            fontSheetArray.addObject(sheet)
        }
        
        fontCollectionView.content = fontSheetArray as [AnyObject]
        
        super.viewDidLoad()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

