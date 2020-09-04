//
//  Pin+Exten.swift
//  Virtual Tourist Virtual Tourist VirtualTourist
//
//  Created by Mohammed on 22/08/2020.
//  Copyright © 2020 Alzuwayyid. All rights reserved.
//

import Foundation
import CoreData

extension Pin {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}
