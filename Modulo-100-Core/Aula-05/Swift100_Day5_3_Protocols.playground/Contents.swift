//: Protocols
// Protocolos são acordos!

// Protocolo 'TenhoDescrição' diz que todos 
// que respeitam esse protocolo tem uma função
// chamada descrição, retorno String

// Programação orientada a aspecto
// Protocolo: descrever aspectos

protocol TenhoDescrição {
    func descrição() -> String
}

struct Retangulo : TenhoDescrição {
    var largura:Double
    var altura:Double
    
    func descrição() -> String {
        return "Retângulo com área \(largura * altura)"
    }
}

class Gato : TenhoDescrição {
    var nome:String
    
    init(nome:String) {
        self.nome = nome
    }
    
    func descrição() -> String {
        return "Sou um gato de nome \(nome)"
    }
}

let meuGato = Gato(nome: "Mike")
let umQuadrado = Retangulo(largura: 2, altura: 2)

meuGato.descrição()
umQuadrado.descrição()



// Além de funções, podemos pedir variáveis ou constantes

protocol QueLigaDesliga {
    var ligado:Bool {get set} // pode ser lida e altera
}

protocol QueTemMarca {
    var marca:String {get} // só pode ser lida
}

class Veiculo {
    var potencia = 200
}

// podemos utilizar os três dessa maneira

class Motoca : Veiculo, QueLigaDesliga, QueTemMarca {
    
    var marca: String
    var ligado: Bool = false
    
    init(marca umaMarca:String) {
        marca = umaMarca
    }
}

var minhaMoto = Motoca(marca: "Honda")
minhaMoto.ligado = true

// Podemos utilizar o mesmo protocolo
// para outras classes onde ele faz sentido

class TV : QueLigaDesliga {
    var ligado: Bool = false
}

