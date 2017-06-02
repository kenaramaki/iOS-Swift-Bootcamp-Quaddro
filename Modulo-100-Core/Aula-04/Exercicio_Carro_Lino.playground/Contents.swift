// Desafio

// Crie uma classe Motor, que tenha:
// * potência:Int (90cv, etc)
// * combustível:String (gasolina, álcool, flex, diesel)
// * ativo:Bool (variável que indica se está ligado ou não)
// * nivelDoÓleo:Float (1.0 cheio, 0.0 vázio)
// * kmsRodados:Int
// - rodar(kms:Int) // hard: a cada 100km, abaixe 10% do óleo

class Motor{
    
    var potencia:Int
    var combusível:String
    var ativo:Bool
    var nívelDoÓleo:Float
    var kmsRodados:Int
    
    init(tipo:String, potencia:Int){
        self.combusível = tipo
        self.potencia = potencia
        self.ativo = false
        self.nívelDoÓleo = 1.0
        self.kmsRodados = 0
    }
    
    // a cada 100km, abaixe 10% do óleo
    func rodar(kms:Int){
        for _ in 1...kms{
            self.nívelDoÓleo -= 0.001
            self.kmsRodados  += 1
            
            if self.nívelDoÓleo <= 0 {
                self.nívelDoÓleo = 0
                print("Acabou o óleo do carro!")
                return
            }
        }
    }
    
}

let meuMotor = Motor(tipo: "diesel", potencia: 380)
meuMotor.rodar(1300)
print("Quantidade de kms rodados: \(meuMotor.kmsRodados)")

// Crie uma classe Pneu, que tenha
// * marca:String (ex: pirelli, goodyear)
// * furado:Bool
// * aro:Int (hard: permitir somente aros válidos: 13,14,15,16
// * kmsRodados:Int
// - rodar(kms:Int) // hard: a cada 5km, existe 5% de chance de furar

import Darwin

class Pneu {
    
    let marca:String
    var furado:Bool
    let aro:Int
    var kmsRodados:Int
    
    init(marca:String, aro:Int){
        
        self.marca = marca
        
        if aro < 13 || aro > 16 {
            self.aro = 13
        }else{
            self.aro = aro
        }
        
        self.furado = false
        self.kmsRodados = 0
    }
    
    // a cada 5km, existe 5% de chance de furar
    func rodar(kms:Int){
        for _ in 1...kms{
            
            self.kmsRodados += 1
            
            if Int(arc4random_uniform(101)) < 5 {
                if self.kmsRodados % 5 == 0 {
                    self.furado = true
                    print("Ops, furou o pneu! ☠️")
                    return
                }
            }
        }
    }
    
}

let meuPneu = Pneu(marca: "Pirelli", aro: 16)
meuPneu.rodar(10)

// Crie uma classe Carro, que tenha:
// cor:String
// ano:Int
// marca:String
// pneus:[Pneu]
// motor:Motor
// - rodar(kms:Int) // repasse os kms pros pneus e carro

class Carro {
    
    var cor:String
    let ano:Int
    let marca:String
    
    var motor:Motor
    var pneus:[Pneu]
    
    // outros podem ver, somente eu posso alterar
    public private(set) var kmsRodados:Int
    
    init(marca:String, cor:String, tipo:String, aro:Int){
        
        self.marca  = marca
        self.cor    = cor
        
        switch tipo {
        case "gasolina":
            self.motor = Motor(tipo: tipo, potencia: 120)
        case "álcool":
            self.motor = Motor(tipo: tipo, potencia: 150)
        case "diesel":
            self.motor = Motor(tipo: tipo, potencia: 300)
        case "flex":
            fallthrough
        default:
            self.motor = Motor(tipo: "flex", potencia: 130)
        }
        
        self.pneus = []
        for _ in 1...4{
            let umPneu = Pneu(marca: "Pirelli", aro: aro)
            self.pneus.append(umPneu)
        }
        
        self.ano = 2016
        self.kmsRodados = 0
    }
    
    func rodar(kms:Int){
        
        for _ in 1...kms{
            
            self.motor.rodar(1)
            self.pneus.forEach{ $0.rodar(1) }
            self.kmsRodados += 1
            
            if self.motor.nívelDoÓleo == 0{
                print("Paramos por falta de óleo")
                return
            }
            
            for pneu in pneus {
                if pneu.furado {
                    print("Paramos porque o pneu furou")
                    return
                }
            }
            
        }
        
    }
    
}

let meuCarro = Carro(marca: "Troller", cor: "Verde", tipo: "diesel", aro: 17)

print("------------------")
meuCarro.rodar(120)
print("Rodei \(meuCarro.kmsRodados) antes de parar")

meuCarro.kmsRodados = 10
print("Meu carro já rodou \(meuCarro.kmsRodados) kms")


// Agora monte seu carro :)