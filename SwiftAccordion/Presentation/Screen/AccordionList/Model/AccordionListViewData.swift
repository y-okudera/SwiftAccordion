//
//  AccordionListViewData.swift
//  SwiftAccordion
//
//  Created by Yuki Okudera on 2021/12/04.
//

import Foundation

struct AccordionListViewData {
    var accordionModels = [AccordionModel]()

    mutating func setDummyData() {

        let longText = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."

        self.accordionModels = [
            .init(isOpened: false, text: "Abituriyent", child: .init(text: "Til kurslari")),
            .init(isOpened: false, text: "Kurs", child: .init(text: "Two lines\ntexts.")),
            .init(isOpened: false, text: "Guruh darajasi", child: .init(text: longText)),
            .init(isOpened: false, text: "Kun", child: .init(text: longText)),
            .init(isOpened: false, text: "Vaqti", child: .init(text: longText)),
            .init(isOpened: false, text: "Turi", child: .init(text: longText)),
        ]
    }

    func accordionModel(at index: Int) -> AccordionModel {
        return accordionModels[index]
    }

    mutating func toggleIsOpened(at index: Int) {
        let accordionModel = accordionModels[index]
        accordionModels[index] = .init(
            isOpened: !accordionModel.isOpened,
            text: accordionModel.text,
            child: accordionModel.child
        )
    }
}
