//
//  AccordionHeaderView.swift
//  SwiftAccordion
//
//  Created by Yuki Okudera on 2021/12/04.
//

import UIKit

protocol AccordionHeaderViewDelegate: AnyObject {
    func headerViewTapped(at indexPath: IndexPath?)
}

final class AccordionHeaderView: UICollectionReusableView {

    static let height = CGFloat(53)

    @IBOutlet private weak var accordionTitleLabel: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!

    weak var delegate: AccordionHeaderViewDelegate?
    private var indexPath: IndexPath?
    private var isOpened = false

    override init(frame: CGRect) {
        super.init(frame: frame)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerViewTapped))
        addGestureRecognizer(tapGesture)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerViewTapped))
        addGestureRecognizer(tapGesture)
    }

    @objc
    private func headerViewTapped() {
        delegate?.headerViewTapped(at: indexPath)
    }

    func configure(title: String, isOpened: Bool, indexPath: IndexPath) {
        accordionTitleLabel.text = title
        self.isOpened = isOpened
        arrowImageView.image = isOpened ? .init(named: "arrow_up") : .init(named: "arrow_down")

        self.indexPath = indexPath
    }
}
