//
//  EntryViewController.swift
//  Notes
//
//  Created by Sarah Lee on 2/28/21.
//

import UIKit

class EntryViewController: UIViewController {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    
    // We are going to assign this completion handler from the other controller that shows this controller. Once the user hit save, we call this.
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // When this page is loaded, we will show the keyboard. It will auto focus
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Save", style: .done, target: self, action: #selector(didTapSave))
    }
    
    @objc func didTapSave() {
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty {
            completion?(text, noteField.text)
        }
    }

}
