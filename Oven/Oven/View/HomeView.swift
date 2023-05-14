//
//  ContentView.swift
//  Oven
//
//  Created by 금가경 on 2023/05/06.
//

import SwiftUI

extension Comparable {
    func clamp<T: Comparable>(lower: T, _ upper: T) -> T {
        return min(max(self as! T, lower), upper)
    }
}

extension CGSize {
    static var inactiveThumbSize:CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    static var activeThumbSize:CGSize {
        return CGSize(width: 85, height: 50)
    }
    
    static var trackSize:CGSize {
        return CGSize(width: 310, height: 50)
    }
}

extension HomeView {
    func onSwipeSuccess(_ action: @escaping () -> Void ) -> Self {
        var this = self
        this.actionSuccess = action
        return this
    }
}

struct HomeView: View {
    
    // we want to animate the thumb size when user starts dragging (swipe)
    @State private var thumbSize:CGSize = CGSize.inactiveThumbSize
    
    // we need to keep track of the dragging value. Initially its zero
    @State private var dragOffset:CGSize = .zero
    
    // Lets also keep track of when enough was swiped
    @State private var isEnough = false
    
    // Actions
    private var actionSuccess: (() -> Void )?
    
    
    // The track does not change size
    let trackSize = CGSize.trackSize
    //    let view = HomeView()
    
    @State var isShowingCompassView = false
    @State var isOnboardingTabViewPresented = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(red: 0.15, green: 0.15, blue: 0.15)
                    .ignoresSafeArea()
                ZStack {
                    ZStack {
                        Button(action: {
                            isOnboardingTabViewPresented.toggle()
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                Text("?")
                                    .font(.custom("esamanruOTFLight", size: 18))
                                    .foregroundColor(glowWhite)
                            }
                        }
                        .frame(width: geometry.size.width * 0.1, height: geometry.size.width * 0.1)
                        .offset(x : geometry.size.width * 0.36, y : -geometry.size.height * 0.45)
                        .foregroundColor(surgeonOrange)
                    }
                    .sheet(isPresented: $isOnboardingTabViewPresented) {
                        OnboardingTabAgainView()
                    }
                    .border(.white)
                    Spacer()
                    
                    //트랙
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.13)
                        .foregroundColor(slideGray)
                    
                    //슬라이드 바 버튼
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: geometry.size.width * 0.13, height: geometry.size.width * 0.13)
                        .foregroundColor(surgeonOrange)
                        .offset(x: getDragOffsetX(), y: 0)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in self.handleDragChanged(value) })
                                .onEnded({ value in
                                    self.handleDragEnded()
                                    if value.translation.width > 100 { // Replace with your own threshold value
                                        self.isShowingCompassView = true
                                    }
                                })
                        )
                    Spacer()
                }
            }
            .background(
                NavigationLink(destination: CompassView(), isActive: $isShowingCompassView) {
                }.navigationBarHidden(true)
            )
        }
        .navigationBarHidden(true)
    }
    
    // MARK: - Helpers
    private func getDragOffsetX() -> CGFloat {
        // should not be able to drag outside of the track area
        
        let clampedDragOffsetX = dragOffset.width.clamp(lower: 0, trackSize.width - thumbSize.width)
        
        return -( trackSize.width/2 - thumbSize.width/2 - (clampedDragOffsetX))
    }
    
    // MARK: - Gesture Handlers
    private func handleDragChanged(_ value:DragGesture.Value) -> Void {
        self.dragOffset = value.translation
        
        let dragWidth = value.translation.width
        let targetDragWidth = self.trackSize.width - (self.thumbSize.width*2)
        //        let wasInitiated = dragWidth > 2
        let didReachTarget = dragWidth > targetDragWidth
        
        self.thumbSize = CGSize.inactiveThumbSize
        
        if didReachTarget {
            // only trigger once!
            if !self.isEnough {
                HapticManager.instance.notification(type: .success)
                HapticManager.instance.impact(style: .heavy)
            }
            self.isEnough = true
        }
        else {
            self.isEnough = false
        }
    }
    
    private func handleDragEnded() -> Void {
        // If enough was dragged, complete swipe
        if self.isEnough {
            self.dragOffset = CGSize(width: self.trackSize.width - self.thumbSize.width, height: 0)
            
            // the outside world should be able to know
            if nil != self.actionSuccess {
                HapticManager.instance.notification(type: .success)
                HapticManager.instance.impact(style: .heavy)
                
                // wait and give enough time for animation to finish
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    self.actionSuccess!()
                }
            }
            
        }
        else {
            self.dragOffset = .zero
            self.thumbSize = CGSize.inactiveThumbSize
        }
        
        
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



