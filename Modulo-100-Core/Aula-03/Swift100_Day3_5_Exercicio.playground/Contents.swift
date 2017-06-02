
// Exercício

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


// random em Swift
import Foundation
Int(arc4random_uniform(100)+1)

class Motor {
    
    let potencia:Int
    var combustivel:String
    var ativo:Bool
    var nivelDoOleo:Float
    var kmsRodados:Int
    
    init(potencia:Int, combustivel: String){
        self.potencia    = potencia
        self.combustivel = combustivel
        
        self.ativo       = false
        self.nivelDoOleo = 1.0
        self.kmsRodados  = 0
    }
    
    func rodar(kms:Int){
        let cada100km = kms/100
        nivelDoOleo = nivelDoOleo - nivelDoOleo * Float(cada100km) * 0.1
        if nivelDoOleo <= 0 {
            print("Sem óleo")
        }else {
            print("Nível do óleo: \(nivelDoOleo)")
        }
    }
    
    
}

var motor1 = Motor(potencia: 360, combustivel: "gasolina")
motor1.rodar(800)
motor1.nivelDoOleo

class Pneu {
    
    let marca:String
    var furado:Bool
    var kmsRodados: Int
    let aro: Int
    
    /*
    var aro:Int { // apenas aros 13, 14, 15, 16
        didSet{
            //validAro()
        }
    }
    */
    
    init(marca:String, aro:Int){
        self.marca = marca
        self.furado = false
        //self.aro = (aro > 16 || aro < 13) ? 13 : aro
        
        if aro < 13 || aro > 16 {
            print("Aro inválido")
            self.aro = 0
        } else {
            self.aro = aro
        }
        
        self.kmsRodados = 0
        
        //validAro()
    }
    
    /*
    func validAro(){
        self.aro = self.aro > 16 || self.aro < 13 ? 13 : self.aro
    }
    */
    
    func rodar(kms: Int){
        let cada5km = kms/5
        var chanceDeFurar = Int(arc4random_uniform(100)+1)
        
        
        
    }
}

var pneu1 = Pneu(marca: "Ford", aro: 18)
pneu1.aro
