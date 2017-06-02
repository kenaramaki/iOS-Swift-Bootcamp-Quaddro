//: Herança é um conceito importante em Programação Orientada a objetos
// Utilizado com bastante frequência, gerando ganhos em clareza e
// reaproveitamento de código

// Classe Base
class Personagem {
    var vida:Int = 10_000
    
    func gritar() -> String {
        if vida > 8000 {
            return "Haaaa!"
        }else {
            return "Arrrrgh"
        }
    }
}

// dizemos que Inimigo herda de Personagem
// Personagem é superclass de Inimigo
// Inimigo é subclasse de Personagem
class Inimigo : Personagem {
    let defesa:Int = 6_000
    
    // override modifica um comportamento herdado
    override func gritar() -> String {
        return "MUAHAHAHA"
    }
}

class Herói : Personagem {
    let ataque:Int = 9_500
    
    func atacar(alvo:Inimigo){
        alvo.vida -= self.ataque - alvo.defesa
    }
}

let goku = Herói()
let vegeta = Inimigo()

print("Goku grita: " + goku.gritar())
goku.atacar(vegeta)

// Quantos pontos de vida tem vegeta?
print("Goku ataca Vegeta, que agora tem \(vegeta.vida) pontos de vida")
print("Vegeta grita: " + vegeta.gritar())


// Quick Fix

// Faça uma classe 'Animal', em seguida e a partir dessa uma classe Cachorro e outra Gato
// Crie propriedades e métodos, pelo menos 3 de cada, pensando em herança e orientação a
// objetos.
// Obs: Não precisa implementar od métodos em detalhe

class Animal {
    let cor:String
    let raça:String
    var peso:Double
    var altura:Double
    
    init(cor:String, raça:String, peso:Double, altura:Double){
        self.cor    = cor
        self.raça   = raça
        self.peso   = peso
        self.altura = altura
    }
    
    func barulhinho(){
    }
    
    func comer() -> String {
        self.peso += 10
        return "Comendo..."
    }
    
    func dormir() -> String {
        return "Dormindo..."
    }
    
}

class Cachorro : Animal {
    
    var contadorDeOssosEnterrados:Int
    
    override init(cor:String, raça:String, peso:Double, altura:Double){
        self.contadorDeOssosEnterrados = 0
        super.init(cor: cor, raça: raça, peso: peso, altura: altura)
    }
    
    override func barulhinho() {
        print("Au au")
    }
    
    func lamberBolas() -> String {
        return "Lambendo as bolas..."
    }
    
    func correrAtrasDoCarteiro() -> String {
        return "Correndo atrás do carteiro..."
    }
    
}

class Gato : Animal {
    
    override func barulhinho() {
        print("Miau")
    }
    
    func ignorarHumano() -> String {
        return "Ignorando humano..."
    }
    
    func soltarPeloPelaCasa() -> String {
        return "Soltando pêlo pela casa..."
    }
}


class Capivara : Animal {
    
    var qtdCarrapatoEstrela:Int
    
    init(raça: String, peso: Double, altura: Double) {
        self.qtdCarrapatoEstrela = 0
        super.init(cor: "marrom", raça: raça, peso: peso, altura: altura)
    }
}

