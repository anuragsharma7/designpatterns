import UIKit
import Combine
import SwiftUI

var greeting = "Hello, playground"

// 1. The Observer Pattern (Presentation Layer - MVVM)
// If one obj changes anything then all the objs will change or notified who are depended on that obj

class AvatarViewModel: ObservableObject {
    @Published var isAvatarListening = false
}

struct AvatarView: View {
    @StateObject private var vm = AvatarViewModel()
    
    var body: some View {
        
        Text(vm.isAvatarListening ? "its listening" : "Its not listening")
            .onTapGesture {
                vm.isAvatarListening.toggle()
            }
            .font(.largeTitle)
        
    }
}

// The Command Pattern
// Instead of writing the core business logic in viewmodel we take it out from it and write it in usecases Impl structs

protocol FetchActiveAllergiesUseCase {
    func exexute() -> [String]
}

struct FetchActiveAllergiesUseCaseImpl: FetchActiveAllergiesUseCase {
    func exexute() -> [String] {
        let allAlergies = ["Peanuts", "Dust", "Penicillin"]
 
        return allAlergies.filter { !$0.contains("Dust")}
    }
}

    
