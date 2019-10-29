//
//  DataControllerDelegate.swift
//  AppDemo
//
//  Created by MAC on 29/10/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import Foundation

protocol DataControllerDelegate: class {
    func didReceivedPeople(people: [Person])
}
