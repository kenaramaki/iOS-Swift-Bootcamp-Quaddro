//: Generics


func invertePontasVetorInteiros(vetor:[Int]) -> [Int]{
    
    // 1) Garantir que temos pontas
    guard let ultimo = vetor.last,
        let primeiro = vetor.first else{
            return vetor
    }
    
    // 2) Troca
    var novo = vetor
    novo[0] = ultimo
    novo[vetor.count - 1] = primeiro
    return novo
}

var nossoVetor = [1,2,3,4]
invertePontasVetorInteiros(nossoVetor)


// mas, e se eu quiser também inverter vetores de Strings? UInt8, Int32
// Precisa criar uma função para cada?
// Para isso utilizamos generics


func invertePontas<T>(vetor:[T]) -> [T] {
    
    // 1) Garantir que temos pontas
    guard let ultimo = vetor.last,
        let primeiro = vetor.first else{
            return vetor
    }
    
    // 2) Troca
    var novo = vetor
    novo[0] = ultimo
    novo[vetor.count - 1] = primeiro
    return novo

}

invertePontas([2.5, 1.2, 3.5])
invertePontas(["Ken", "Thiago", "Bia"])



// E quando preciso fazer operações?
// Por exemplo, comparar valores?

func éIgual<T where T:Equatable>(a:T, _ b:T) -> Bool {
    return a == b
}

éIgual("a","b")
éIgual("a","a")
éIgual(10, 20)
éIgual(20, 20)



// https://www.raywenderlich.com/
// https://ijoshsmith.com/2014/07/05/custom-threading-operator-in-swift/
// https://get.fabric.io/
// https://github.com/apple/swift-evolution
