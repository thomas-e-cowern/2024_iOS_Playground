//
//  DamageView.swift
//  MultistepFormPlayground
//
//  Created by Thomas Cowern on 8/22/24.
//

import SwiftUI

struct DamageView: View {
    
    @Binding var damage: Damage
    
    var body: some View {
        Form {
            Picker("Select Damage Level", selection: $damage.type) {
                ForEach(DamageType.allCases, id: \.self) { type in
                    Text(type.description)
                }
            }
            .pickerStyle(.wheel)
            Text(damage.type.description)
        }
    }
}

#Preview {
    DamageView(damage: .constant(Damage(type: DamageType.catastrophic)))
}
