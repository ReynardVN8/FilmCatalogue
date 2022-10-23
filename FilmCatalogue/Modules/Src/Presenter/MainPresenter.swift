//
//  MainInteractor.swift
//  FilmCatalogue
//
//  Created by Reynard Vincent Nata on 11/10/22.
//

import Foundation

class MainPresenter{
    func isLastScreen(currentID: Int, lastID: Int, nextPage: Int, totalPage: Int) -> Bool{
        return (currentID == lastID && nextPage <= totalPage)
    }
}
