//
//  ViewController.swift
//  ios-uitextfield-test
//
//  Created by Kentaro on 2019/10/17.
//  Copyright © 2019 Kentao Taguchi. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - IBOutlet

    @IBOutlet private weak var lastNameTextField: UITextField!

    @IBOutlet private weak var firstNameTextField: UITextField!

    @IBOutlet private weak var button: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private

    private func setup() {

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textDidChange),
            name: UITextField.textDidChangeNotification,
            object: nil)
    }

    @objc private func textDidChange(sender: Notification) {
        guard let textField = sender.object as? UITextField else { return }
        trimText(textField)
        updateButtonEnabled()
    }

    private func trimText(_ textField: UITextField) {

        let trimedText = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        textField.text = trimedText
    }

    private func updateButtonEnabled() {
        button.isEnabled = validateNames()
    }

    private func validateNames() -> Bool {
        !(lastNameTextField.text?.isEmpty == true
            && firstNameTextField.text?.isEmpty == true)
    }
}
