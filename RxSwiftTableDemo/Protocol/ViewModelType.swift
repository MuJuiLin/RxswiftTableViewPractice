//
//  ViewModelType.swift
//
//  Created by joseewu
//

import Foundation

//protocol ViewModelType {
//    associatedtype Dependency
//    associatedtype Bindings
//    init(dependency: Dependency, bindings: Bindings)
//}
protocol ViewModelType {
    associatedtype Dependency
    associatedtype Bindings:ViewModelBindingType
    var dependency:Dependency! {get set}
    var output:Bindings.Output! {get set}
    init(with dependency:Dependency)
    func bind(with bindings:Bindings.Input)
}
protocol ViewModelBindingType {
    associatedtype Input
    associatedtype Output
    var input: Input { get }
    var output: Output { get }
}

protocol ViewModelBinding {
    associatedtype Inputs
    associatedtype Outputs
    var inputs: Inputs { get }
    var outputs: Outputs { get }
}

protocol ViewModelDependency {
    associatedtype Dependency
    init(withDependency dependency:Dependency)
}
