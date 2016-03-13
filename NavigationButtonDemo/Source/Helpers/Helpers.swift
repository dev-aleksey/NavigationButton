//
//  Helpers.swift
//  NavigationButtonDemo
//
//  Created by Alex on 13/03/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import Foundation

@warn_unused_result
func Init<Type>(value : Type, @noescape block: (object: Type) -> Void) -> Type {
    block(object: value)
    return value
}

