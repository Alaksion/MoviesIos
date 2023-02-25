//
//  ViewState.swift
//  Movies
//
//  Created by Lucca Beurmann on 25/02/23.
//

import Foundation

enum ViewState {
    case loading
    case content
    case error(errorData: Error)
}
