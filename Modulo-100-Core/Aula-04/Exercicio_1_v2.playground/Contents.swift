// Exercício 1 - Herança
// http://pastebin.com/1C47nkvj

// 1.a Faça uma classe Brinquedo, que tenha um método 'mover'.
// Em seguida, crie três classes: Carro, Barco, Avião.
// Sobrescreva o método 'mover' (com override) nestas classes, fazendo um print do texto adequado.
// Ex: "voandoo", para avião.mover().

// 1.b Faça uma classe ControleRemoto, que receba no init um Brinquedo
// e tenha um método 'acionar'. Esse método deve chamar 'mover' do brinquedo.
// let meuControle = ControleRemoto(para:avião)
// meuControle.acionar() // deve mostrar "voandoo"

enum CorDeBrinquedo : String {
    case Azul, Amarelo, Verde, Vermelho, Branco
}


class Brinquedo {
    
    var cor:CorDeBrinquedo
    
    init(cor:CorDeBrinquedo) {
        self.cor = cor
    }
    
    init?(nomeDaCor:String) {
        
        guard let corEscolhida = CorDeBrinquedo(rawValue:nomeDaCor) else{
            print("Cor inválida para o brinquedo")
            self.cor = .Branco
            return nil
        }
        
        self.cor = corEscolhida
    }
    
    func mover(){
        
    }
}

class Carro : Brinquedo {
    override func mover() {
        print("Andando")
    }
}

class Barco : Brinquedo {
    override func mover() {
        print("Navegando")
    }
}

class Avião : Brinquedo {
    override func mover() {
        print("Voando")
    }
}

var meuCarro = Carro(nomeDaCor: "Verde") ?? Carro(cor: .Branco)
print("Cor do carro: \(meuCarro.cor.rawValue)")
meuCarro.mover()

var meuAvião = Avião(cor: .Verde)

// -------------------------------
class ControleRemoto{
    var brinquedo : Brinquedo
    
    init(brinquedo:Brinquedo){
        self.brinquedo = brinquedo
    }
    
    func acionar() {
        brinquedo.mover()
    }
}

var meuControle = ControleRemoto(brinquedo: meuCarro)
meuControle.acionar()

meuControle.brinquedo = meuAvião
meuControle.acionar()


var carro1 = Carro(nomeDaCor: "Roxo") ?? Carro(cor: .Branco)
print(carro1.cor)
