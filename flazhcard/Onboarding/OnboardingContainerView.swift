//
//  OnboardingContainerView.swift
//  flazhcard
//
//  Created by vica valencia on 22/07/22.
//

import SwiftUI

struct OnboardingContainerView: View {
    
    @State var selection = 0
    @Environment(\.colorScheme) var colorScheme
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: "black")
        UIPageControl.appearance().pageIndicatorTintColor = .systemGray
    }
    
    var onboardingArray = [
        OnboardingModel(
            imageName: "onboard_1",
            title: "No more\nWasted Paper",
            content: "FlazhCard helps you to review\nyour notes easily 1")
    ]
    
    var body: some View {
        
        GeometryReader { geo in
            VStack {
                TabView(selection: $selection) {
                    
                    OnboardingView(
                        imageName: "onboard_1",
                        title: "No more\nWasted Paper",
                        content: "FlazhCard helps you to review\nyour notes easily"
                    )
                    .tag(0)
                    
                    OnboardingView(
                        imageName: "onboard_2",
                        title: "Easier,\nAnd Faster",
                        content: "Take your notes, review,and\nmemorize at lightning fast speeds"
                    )
                    .tag(1)
                    
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .ignoresSafeArea(edges: .top)
                .frame(width: geo.size.width, height: geo.size.height - 150)
                .animation(.default, value: selection)
                
                Button {
                    if selection >= 1 {
                        selection = 0
                    }
                    
                    selection += 1
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(selection == 1 ? .red : .gray)
                        Text(selection == 1 ? "Let's Get Started" : "Next")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .frame(height: 50)
                .padding(.horizontal)
            }
            .frame(maxHeight: .infinity)
        }
        .ignoresSafeArea()
    }
}

struct OnboardingContainerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingContainerView().preferredColorScheme(.light)
            OnboardingContainerView().preferredColorScheme(.dark)
        }
    }
}
