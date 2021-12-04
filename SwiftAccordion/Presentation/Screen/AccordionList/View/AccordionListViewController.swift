//
//  AccordionListViewController.swift
//  SwiftAccordion
//
//  Created by Yuki Okudera on 2021/12/01.
//

import UIKit

final class AccordionListViewController: UIViewController {

    var viewData = AccordionListViewData()

    @IBOutlet private weak var collectionView: UICollectionView! {
        willSet {
            newValue.dataSource = self
            newValue.delegate = self

            let cellTypes = [
                GroupNameCollectionViewCell.self,
                AccordionCollectionViewCell.self,
            ]
            cellTypes.forEach {
                newValue.register(
                    UINib(
                        nibName: $0.identifier,
                        bundle: .init(for: type(of: self))
                    ),
                    forCellWithReuseIdentifier: $0.identifier
                )
            }
            newValue.register(
                UINib(
                    nibName: AccordionHeaderView.identifier,
                    bundle: .init(for: type(of: self))
                ),
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: AccordionHeaderView.identifier
            )
        }
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Guruh qo'shish"
        viewData.setDummyData()
    }
}

// MARK: - UICollectionViewDataSource
extension AccordionListViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // A GroupNameCollectionViewCell and multiple AccordionCollectionViewCells
        return 1 + viewData.accordionModels.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }

        if viewData.accordionModel(at: section - 1).isOpened {
            return 1
        } else {
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: GroupNameCollectionViewCell.identifier,
                for: indexPath
            ) as! GroupNameCollectionViewCell
            cell.configure(name: "Nomi", groupName: "Guruh nomi")
            return cell
        }

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AccordionCollectionViewCell.identifier,
            for: indexPath
        ) as! AccordionCollectionViewCell
        cell.configure(title: viewData.accordionModel(at: indexPath.section - 1).child.text)
        return cell

    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: AccordionHeaderView.identifier,
            for: indexPath
        ) as! AccordionHeaderView

        let accordionModel = viewData.accordionModel(at: indexPath.section - 1)
        header.configure(
            title: accordionModel.text,
            isOpened: accordionModel.isOpened,
            indexPath: indexPath
        )
        header.delegate = self
        return header
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AccordionListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        let height: CGFloat = {
            if indexPath == [0, 0] {
                return GroupNameCollectionViewCell.height
            } else {
                return AccordionCollectionViewCell.height
            }
        }()

        return CGSize(width: UIScreen.main.bounds.width - 32, height: height)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return .init(top: 4, left: 16, bottom: 16, right: 16)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        let height: CGFloat = {
            if section == 0 {
                return .zero
            } else {
                return AccordionHeaderView.height
            }
        }()

        return CGSize(width: UIScreen.main.bounds.width - 32, height: height)
    }
}

// MARK: - AccordionHeaderViewDelegate
extension AccordionListViewController: AccordionHeaderViewDelegate {
    func headerViewTapped(at indexPath: IndexPath?) {
        guard let indexPath = indexPath else {
            return
        }
        viewData.toggleIsOpened(at: indexPath.section - 1)
        collectionView.reloadData()
    }
}
