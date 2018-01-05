//
//  MaskTextField.swift
//  Rewards
//
//  Created by Lucas Bordini Ribeiro de Araujo on 05/01/18.
//  Copyright © 2018 Venturus. All rights reserved.
//

import Foundation
import UIKit

class MaskTextField:NSObject, UITextFieldDelegate {

    var maskForField = ""
    var fieldLength = 0
    var separatorToAdd: [String] = []
    var positionOfSeparators: [Int] = []

    init(mask: String){
        self.maskForField = mask
        self.fieldLength = mask.count
        for i in 0..<maskForField.count {
            if (self.maskForField[i] != "#") {
                separatorToAdd.append(self.maskForField[i])
                positionOfSeparators.append(i)
            }
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if var textToMask = textField.text, string != ""{
            if textToMask.count == self.fieldLength {return false}
            textToMask += shouldAddSeparator(actualPosition: textToMask.count)
            textToMask += string
            textField.text = textToMask
        }
        if string == ""{
            textField.text?.removeLast()
        }
        return false
    }

    func shouldAddSeparator(actualPosition: Int) -> String{
        var textToShow: String = ""
        if actualPosition == self.positionOfSeparators.first{
            textToShow += self.separatorToAdd.removeFirst()
            self.positionOfSeparators.removeFirst()
            let nextPosition = actualPosition + 1
            if nextPosition == self.positionOfSeparators.first {
                textToShow += self.shouldAddSeparator(actualPosition: nextPosition)
            }
        }
        return textToShow
    }

}

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }

    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }

    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[Range(start ..< end)])
    }
}
