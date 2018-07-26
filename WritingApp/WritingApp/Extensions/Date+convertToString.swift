//
//  Date+convertToString.swift
//  WritingApp
//
//  Created by Richard Wang on 7/25/18.
//  Copyright © 2018 Richard Wang. All rights reserved.
//

import Foundation
import CoreData



extension Date {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: self, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}

extension NSDate {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: (self as Date), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}
