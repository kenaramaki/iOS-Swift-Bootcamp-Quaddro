
import Foundation

// Crie uma classe Motor, que tenha:
// * potência:Int (90cv, etc)
// * combustível:String (gasolina, álcool, flex, diesel)
// * ativo:Bool (variável que indica se está ligado ou não)
// * nivelDoÓleo:Float (1.0 cheio, 0.0 vázio)
// * kmsRodados:Int
// - rodar(kms:Int) // hard: a cada 100km, abaixe 10% do óleo
class Motor {
    
    var potencia:Int
    var combustível:String
    var ativo: Bool
    var nivelDoOleo:Float
    var kmsRodados:Int
    
    init(tipo:String){
        combustível = tipo
        
        switch combustível {
        case "gasolina":
            potencia = 1600
        case "flex":
            potencia = 1000
        case "alcool":
            potencia = 1800
        default:
            potencia = 1000
        }
        
        kmsRodados  = 0
        nivelDoOleo = 1.0
        ativo       = false
    }
    
    func rodar(kms:Int) {
        
        for _ in 1...kms {
            
            nivelDoOleo -= 0.001
            
            if nivelDoOleo <= 0 {
                nivelDoOleo = 0
                print("Estamos sem óleo 🛢")
                return
            }else{
                kmsRodados += 1
            }
        }
    }
    
    func trocarÓleo() {
        self.nivelDoOleo = 1.0
    }
    
}


let meuMotor = Motor(tipo: "flex")
meuMotor.potencia
meuMotor.nivelDoOleo

print("Rodando...")
meuMotor.rodar(300)
print(meuMotor.nivelDoOleo)
meuMotor.trocarÓleo()

print("Vamos trocar o óleo")
print(meuMotor.nivelDoOleo)
meuMotor.rodar(120)
print(meuMotor.kmsRodados)

// Crie uma classe Pneu, que tenha
// * marca:String (ex: pirelli, goodyear)
// * furado:Bool
// * aro:Int (hard: permitir somente aros válidos: 13,14,15,16
// * kmsRodados:Int
// - rodar(kms:Int) // hard: a cada 5km, existe 5% de chance de furar

class Pneu {
    
    let marca:String
    let aro:Int
    
    var furado:Bool
    var kmsRodados:Int
    
    init(marca m:String, aro a:Int){
        
        self.marca = m
        
        // só é permitido alguns tipos de aro
        if a >= 13 && a <= 16 {
            self.aro = a
        }else{
            self.aro = 13
        }
        
        self.furado      = false
        self.kmsRodados  = 0
    }
    
    func rodar(kms:Int) {
        for _ in 1...kms {
            
            // a cada 5km, existe 5% de chance de furar
            if kmsRodados % 5 == 0 && Int(arc4random_uniform(1000) + 1) < 1 {
                self.furado = true
                print("Furou um pneu! 🚔")
                return
            }else{
                kmsRodados += 1
            }
        }
    }
    
}

print("Vamos rodar o pneu")
var umPneu = Pneu(marca: "Pirelli", aro: 15)
umPneu.rodar(1000)
print("O pneu rodou: \(umPneu.kmsRodados)")


class Carro {
    
    // cor:String
    // ano:Int
    // marca:String
    // pneus:[Pneu]
    // motor:Motor
    
    var cor:String
    let ano:Int
    let marca:String
    var kmsRodados:Int
    
    var motorDoCarro:Motor // um só
    var pneusDoCarro:[Pneu] // são 4
    
    init(marca:String, cor:String, tipo:String, aro:Int){
        
        self.ano = 2016
        self.marca = marca
        self.cor = cor
        self.kmsRodados = 0
        
        self.motorDoCarro = Motor(tipo: tipo)
        self.pneusDoCarro = []
        for _ in 1...4 {
            let pneu = Pneu(marca: "Pirelli", aro: aro)
            pneusDoCarro.append(pneu)
        }
    }
    
    func rodar(kms:Int){
        for _ in 1...kms {
            
            if self.motorDoCarro.nivelDoOleo == 0 {
                print("Não posso rodar sem óleo!")
                return
            }
            
            for pneu in pneusDoCarro {
                if pneu.furado {
                    print("Não posso rodar com pneu furado! 🙄")
                    return
                }
            }
            
            self.motorDoCarro.rodar(1)
            self.kmsRodados += 1
            // para cada pneu, roda 1 km
            self.pneusDoCarro.forEach{ pneu in
                pneu.rodar(1)
            }
        }
    }
    
}

print("Criando meu carro!! 🚘")
let meuFox = Carro(marca: "VW", cor: "Amarelo", tipo: "gasolina", aro: 15)
meuFox.rodar(1200)
meuFox.motorDoCarro.trocarÓleo()
print("Rodei \(meuFox.kmsRodados) antes de parar! Vamos trocar o óleo")
meuFox.rodar(40)
print("Rodei \(meuFox.kmsRodados) antes de parar!")
