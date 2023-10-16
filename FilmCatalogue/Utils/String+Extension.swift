//
//  String+Extension.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 10/10/22.
//

import Foundation

extension String {
    func toDate(_ format: String) -> Date? {
        let dateString = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(identifier: "UTC")!
        return dateFormatter.date(from: dateString)
    }
}
