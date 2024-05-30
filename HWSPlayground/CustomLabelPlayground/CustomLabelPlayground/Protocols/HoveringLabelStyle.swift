//
//  HoveringLabelStyle.swift
//  CustomLabelPlayground
//
//  Created by Thomas Cowern on 5/30/24.
//

import Foundation
import SwiftUI

protocol HoveringLabelStyle: LabelStyle {
    init(hovering: Bool)
}
