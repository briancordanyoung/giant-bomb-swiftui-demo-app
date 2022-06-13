//
//  GameRental.swift
//  GiantBomb
//
//  Created by Brian Young on 6/12/22.
//

import SwiftUI

struct GameRental: View, Hashable {
    @ObservedObject
    var rentalController: RentalController
    @State var isRented: Bool
    let gameResult: SearchController.Result?

    let fallback = "https://www.giantbomb.com/a/uploads/square_avatar/8/82063/2550128-primeclean.jpg"

    init(rentalController: RentalController, gameResult: SearchController.Result?) {
        self.rentalController = rentalController
        self.gameResult = gameResult

        if let gameResult = gameResult, rentalController.rentals.contains(gameResult.rental) {
            isRented = true
        } else {
            isRented = false
        }
    }

    var body: some View {
        if let gameResult = gameResult {
            VStack {
                HStack {
                    AsyncImage(url: URL(string: gameResult.image ?? fallback))
                        .frame(width: 80, height: 80, alignment: .center)
                    Text(gameResult.name)
                        .padding(.leading, 20)
                }
                if let gameResult = gameResult {
                    if isRented {
                        Button("Return Rental") {
                            rentalController.unrent(gameResult.rental)
                            // TODO: Figure out how to monitor the rentalController and update isRented
                            //       on a change.  This is important for multiple tabs - right now renting
                            //       the same game in one tab does not get reflected in the other tab until
                            //       the other tab is refreshed. 🤨
                            isRented = false
                        }
                    } else {
                        // rentalController.$rentals.contains(gameResult.rental)
                        Button("Rent") {
                            rentalController.rent(gameResult.rental)
                            isRented = true
                        }
                    }
                }
            }
        } else {
            Text("No selection").font(.caption)
        }
    }

    public func hash(into hasher: inout Hasher) {
        guard let gameResult = gameResult else {
            hasher.combine(1)
            return
        }
        hasher.combine(gameResult)
    }

    static func == (lhs: GameRental, rhs: GameRental) -> Bool {
        guard let lhsGameResult = lhs.gameResult,
              let rhsGameResult = rhs.gameResult
        else {
            return false
        }

        return lhsGameResult == rhsGameResult
    }
}

extension SearchController.Result {
    var rental: RentalController.Rental {
        .init(id: id, name: name)
    }
}

//struct GameRental_Previews: PreviewProvider {
//    static var previews: some View {
//        GameRental(
//            name: "Sample Game",
//            image: "https://www.giantbomb.com/a/uploads/square_avatar/8/82063/2550128-primeclean.jpg")
//    }
//}
