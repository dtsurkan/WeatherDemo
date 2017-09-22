//
//  ForecastSectionController.swift
//  WeatherDemo
//
//  Created by Dima Tsurkan on 9/21/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import UIKit
import IGListKit

final class ForecastSectionController: ListSectionController, ListSupplementaryViewSource {
    
    var displayedForecast: Main.Forecast.ViewModel.DisplayedForecast?
    
    // MARK: - Inti
    
    override init() {
        super.init()
        supplementaryViewSource = self
    }
    
    // MARK: - IGListSectionController Overrides
    
    override func numberOfItems() -> Int {
        return (displayedForecast?.forecast.count)!
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 38)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: ForecastCell.self, for: self, at: index) as? ForecastCell else {
            fatalError()
        }
        cell.fillWithForecastItem(item: displayedForecast?.forecast[index])
        return cell
    }
    
    override func didUpdate(to object: Any) {
        displayedForecast = object as? Main.Forecast.ViewModel.DisplayedForecast
    }
    
    // MARK: ListSupplementaryViewSource
    
    func supportedElementKinds() -> [String] {
        return [UICollectionElementKindSectionHeader]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        guard let view = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
                                                                             for: self,
                                                                             nibName: "ForecastHeaderView",
                                                                             bundle: nil,
                                                                             at: index) as? ForecastHeaderView else {
                                                                                fatalError()
        }
        view.day = displayedForecast?.dayName
        return view
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 50)
    }
}
