// 1.a Faça uma classe Brinquedo, que tenha um método 'mover'.
// Em seguida, crie três classes: Carro, Barco, Avião.
// Sobrescreva o método 'mover' (com override) nestas classes, fazendo um print do texto adequado.
// Ex: "voandoo", para avião.mover().


class Brinquedo {
    func mover() {
        print("Brinquedo movendo")
    }
}

class Carro : Brinquedo {
    override func mover() {
        print("Correndo 🏎")
    }
    
    
}

class Avião : Brinquedo {
    override func mover() {
        print("Voando 🛩")
    }
}

class barco : Brinquedo {
    override func mover() {
        print("Navegando 🛳")
    }
}

let meuBrinquedo = Brinquedo()
meuBrinquedo.mover()

// 1.b Faça uma classe ControleRemoto, que receba no init um Brinquedo
// e tenha um método 'acionar'. Esse método deve chamar 'mover' do brinquedo.
// let meuControle = ControleRemoto(para:avião)
// meuControle.acionar() // deve mostrar "voandoo"

class ControleRemoto {
    
    var brinquedoControlado:Brinquedo
    
    init(para brinquedoAlvo:Brinquedo){
        self.brinquedoControlado = brinquedoAlvo
    }
    
    func acionar(){
        brinquedoControlado.mover()
    }
}

let meuCarro = Carro()
let meuControle = ControleRemoto(para: meuCarro)
meuControle.acionar()
