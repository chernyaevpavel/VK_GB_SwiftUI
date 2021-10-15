//
//  AvatarTapAnimationModifire.swift
//  VK_GB_SwiftUI
//
//  Created by Павел Черняев on 15.10.2021.
//

import Foundation
import SwiftUI

struct AvatarTapAnimationModifire: ViewModifier {
    
    @State var scale: CGFloat = 1
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(self.scale)
            .animation(Animation.interpolatingSpring(mass: 2,
                                                     stiffness: 50,
                                                     damping: 6,
                                                     initialVelocity: 0.5))
            
            .onTapGesture {
                withAnimation(.linear(duration: 0.3)) {
                    //тут продавливается и уменьшается
                    self.scale = 0.7
                    
                    //далее как бы отпружинивает на расжатие
                    var dispatchTime = DispatchTime.now() + 0.7
                    DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
                        self.scale = 1.2
                    }
                    
                    //возвращается в исходное состояние немного попружинив
                    dispatchTime = dispatchTime + 0.7
                    DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
                        self.scale = 1
                    }
                }
            }
    }
}

extension View {
    func avatarTapAnimationModifier() -> some View {
        self.modifier(AvatarTapAnimationModifire())
    }
}
