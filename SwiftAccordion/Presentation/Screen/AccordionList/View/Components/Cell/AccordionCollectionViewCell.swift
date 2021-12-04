//
//  AccordionCollectionViewCell.swift
//  SwiftAccordion
//
//  Created by Yuki Okudera on 2021/12/04.
//

import UIKit

final class AccordionCollectionViewCell: UICollectionViewCell {

    static let height = CGFloat(53)

    @IBOutlet private weak var accordionTextView: UITextView!

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        let frame = CGRect.init(origin: attributes.frame.origin, size: .init(width: UIScreen.main.bounds.width - 32, height: attributes.frame.height))
        attributes.frame = frame
        return attributes
    }

    func configure(title: String) {
        accordionTextView.text = title
    }
}
