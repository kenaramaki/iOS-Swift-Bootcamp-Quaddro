//: =

// Crie uma classe Motor, que tenha:
// * potência:Int (90cv, etc)
// * combustível:String (gasolina, álcool, flex, diesel)
// * ativo:Bool (variável que indica se está ligado ou não)
// * nivelDoÓleo:Float (1.0 cheio, 0.0 vázio)
// * kmsRodados:Int
// - rodar(kms:Int) // hard: a cada 100km, abaixe 10% do óleo

// Crie uma classe Pneu, que tenha
// * marca:String (ex: pirelli, goodyear)
// * furado:Bool
// * aro:Int (hard: permitir somente aros válidos: 13,14,15,16
// * kmsRodados:Int
// - rodar(kms:Int) // hard: a cada 5km, existe 5% de chance de furar

// Crie uma classe Carro, que tenha:
// cor:String
// ano:Int
// marca:String
// pneus:[Pneu]
// motor:Motor
// - rodar(kms:Int) // repasse os kms pros pneus e carro

// Agora monte seu carro :)
import Foundation

class Motor{
    
    var potencia:Int
    var combustível:String
    var ativo:Bool
    var nivelDoÓleo:Double
    var kmsRodados:Int
    
    init(tipo:String, potencia:Int) {
        
        self.combustível = tipo
        self.potencia    = potencia
        
        self.ativo          = false
        self.nivelDoÓleo    = 1.0
        self.kmsRodados     = 0
    }
    
    func rodar(kms:Int) {
        
        self.ativo = true
        
        for _ in 1...kms {
            self.kmsRodados += 1 // soma na quilometragem
            self.nivelDoÓleo -= 0.001 // retira 0.1% do óleo
            
            if nivelDoÓleo <= 0 {
                print("Acabou o óleo!!")
                self.ativo = false
                self.nivelDoÓleo = 0
                return // não tem mais o que fazer na função, pode pular fora
            }
            
            if self.kmsRodados%100 == 0 {
                print("Nível do óleo está em: \(self.nivelDoÓleo)")
            }
        }
        
    }
    
}


class Pneu {
    
    // * marca:String (ex: pirelli, goodyear)
    // * furado:Bool
    // * aro:Int (hard: permitir somente aros válidos: 13,14,15,16
    // * kmsRodados:Int
    
    let marca:String
    var furado:Bool
    let aro:Int
    var kmsRodados:Int
    
    init(marca m:String, aro a:Int){
        self.furado = false
        self.kmsRodados = 0
        self.marca = m
        
        if a >= 13 && a <= 16{
            self.aro = a
        }else{
            print("Aro inválido, assumindo valor padrão")
            self.aro = 13
        }
    }
    
    func rodar(kms:Int) {
        
        for _ in 1...kms {
            self.kmsRodados += 1
            
            // pra cada 5km
            if self.kmsRodados % 5 == 0 {
                // 5% de chance de furar
                if arc4random_uniform(1000) < 5 {
                    print("Furou o pneu!!")
                    self.furado = true
                    return
                }
            }
        }
    }
}


let meuMotor = Motor(tipo: "gasolina", potencia: 300)
meuMotor.rodar(120)
meuMotor.rodar(30)
meuMotor.rodar(1000000)

meuMotor.kmsRodados
meuMotor.nivelDoÓleo

let umPneu = Pneu(marca: "Pirelli", aro: 28)
umPneu.rodar(10)


class Carro  {
    
    // cor:String
    // ano:Int
    // marca:String
    // pneus:[Pneu]
    // motor:Motor
    
    var cor:String
    let ano:Int
    let marca:String
    
    var motor:Motor
    var pneus:[Pneu]
    
    init(marca:String, cor:String, tipo:String, potencia:Int, aro:Int){
        
        self.marca = marca
        self.cor = cor
        self.ano = 2016
        
        self.motor = Motor(tipo: tipo, potencia: potencia)
        self.pneus = []
        for _ in 1...4{
            let novoPneu = Pneu(marca: "Pirreli", aro: aro)
            self.pneus.append(novoPneu)
        }
        
    }
    
    func rodar(kms:Int){
        
        for _ in 1...kms {
            
            if motor.nivelDoÓleo <= 0 {
                print("Carro está sem óleo!! Impossível rodar")
                return
            }
            
            if !(pneus.filter{ return $0.furado}).isEmpty {
                print("Carro está com pneu furado")
                return
            }
            
            self.motor.rodar(1)
            for pneu in pneus {
                pneu.rodar(1)
            }
        }
    }
    
    func trocaOleo() {
        self.motor.nivelDoÓleo = 1.0
    }
    
    
}

print("----------------------")
print("Criando meu novo carro")


let meuFiat = Carro(marca: "Fiat", cor: "Prata", tipo: "Gasolina", potencia: 300, aro: 15)
meuFiat.rodar(300)

print("Rodar novamente")
meuFiat.rodar(20)




