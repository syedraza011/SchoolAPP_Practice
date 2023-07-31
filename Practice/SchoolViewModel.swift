//
//  SchoolViewModel.swift
//  Practice
//
//  Created by Syed Raza on 7/31/23.
//

//import Foundation
//
//class SchoolViewModel: ObservableObject{
//    @Published var allSchools = [SchoolResponse]()
//
//    let service = SchoolServiceProtocol
//
//    init (service: SchoolServiceProtocol = SchoolService()){
//        self.service = service
//    }
//    func getSchools() async  {
//        Task{
//            do {
//                allSchools = try await service.fetchSchools()
//            }catch {
//                print(error)
//            }
//        }
//    }
//}
import Foundation

class SchoolViewModel: ObservableObject {
    @Published var allSchools = [SchoolResponse]()
    
    let service: SchoolServiceProtocol
    
    init(service: SchoolServiceProtocol = SchoolService()) {
        self.service = service
    }
    
    func getSchools() async {
        do {
            allSchools = try await service.fetchSchools()
        } catch {
            print(error)
        }
    }
}
