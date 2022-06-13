//
//  RentalController.swift
//  GiantBomb
//
//  Created by Brian Young on 6/12/22.
//

import Foundation

@MainActor
class RentalController: ObservableObject {
    @Published
    public var rentals: Set<Rental> = []

    public func rent(_ rental: Rental) {
        rentals.insert(rental)
    }

    public func unrent(_ rental: Rental) {
        rentals.remove(rental)
    }
}

extension RentalController {
    public struct Rental: Identifiable, Hashable {
        public var id: Int
        public var name: String
    }
}
