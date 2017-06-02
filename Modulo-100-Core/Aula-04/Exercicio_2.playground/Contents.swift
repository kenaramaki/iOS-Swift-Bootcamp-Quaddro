//: Desafio do Carnaval

// 🎉 Desafio de Carnaval 🎉

// Cria um enum "Critério", com os valores:
// Bateria, Evolução, Enredo, Alegorias
import UIKit

enum Criterio {
    case Bateria
    case Evolução
    case Enredo
    case Alegorias
}

// Cria uma classe "EscolaDeSamba", contendo
// * nome:String
// * notas[Critério:[Float?]]
// -> Float?, médiaParaCritério, que recebe um Critério
// -> Float?, médiaFinal // é a soma das médias dos critérios

class EscolaDeSamba {
    
    let nome:String
    var notas:[Criterio:[Double?]] = [:]
    
    init(nome:String) {
        self.nome = nome
    }
    
    func atribuirNotas( criterio:Criterio, novasNotas:[Double?]) {
        self.notas[criterio] = novasNotas
    }
    
    func notaFinal() -> Double? {
        
        var somaDosCriterios:Double = 0
        for (criterio, _) in (notas ?? [:]) {
            
            guard let media = médiaParaCritério(criterio) else{
                continue
            }
            
            somaDosCriterios += media
        }
        
        return somaDosCriterios
    }
    
    func médiaParaCritério(umCriterio:Criterio) -> Double? {
        
        guard let notasCriterio = notas[umCriterio] else{
            return nil
        }
        
        let notasValidas = notasCriterio.flatMap{ $0 }
        
        switch notasValidas.count {
        case 0:
            return 10.0
            
        case 1,2,3:
            
            return notasValidas.sort().last
            
        case 4:
            
            // Desconsidera a menor nota (dropFirst)
            let maioresNotas = notasValidas.sort().dropFirst()
            // Soma as melhores 3 notas
            let soma = maioresNotas.reduce(0){ $0 + $1 }
            return soma/3.0
            
        default:
            return nil
        }
    }
}

// Faça uma classe "Jurados", ela recebe uma escola de samba
// e atribui notas aleatórias, entre 5.0 e 10.0, para os critérios.
// Para isso faça um método atribuirNotas.
// Existe uma chance em 20 do jurado não dar uma nota!
// São quatro notas por critério. Ex: [9.0, 10.0, nil, 9.5]


class Jurados {
    
    let criterio:Criterio
    
    init(criterio:Criterio) {
        self.criterio = criterio
    }
    
    func avaliar(escola:EscolaDeSamba){
        
        var notasDadas:[Double?] = []
        
        for _ in 1...4 {
            
            if arc4random_uniform(100) < 20 {
                notasDadas.append(nil)
            }else{
                let umaNota = 5.0+Double(arc4random_uniform(51))/10
                notasDadas.append(umaNota)
            }
        }
        
        escola.atribuirNotas(criterio, novasNotas: notasDadas)
        
    }
    
}

// Regra da média das notas: são quatro notas, de 5.0 até 10.0. Deve descartar a menor e tirar a média das restantes. Se alguma nota faltar, considera o valor da maior das notas válidas. Se todas faltarem, fica com 10.0.

// Crie uma classe "Carnaval", onde
// * escolas:[EscolaDeSamba]
// * jurados:Jurados
// -> Void, init(escolas:[EscolaDeSamba])
// -> Void, apurar() // os jurados dão as notas
// -> EscolaDeSamba, vencedora()

class Carnaval {
    
    var escolas:[EscolaDeSamba]
    var jurados:[Criterio:Jurados]
    
    init(escolas:[EscolaDeSamba]) {
        self.escolas = escolas
        
        jurados = [
            .Bateria: Jurados(criterio: .Bateria),
            .Alegorias: Jurados(criterio: .Alegorias),
            .Evolução: Jurados(criterio: .Evolução),
            .Enredo: Jurados(criterio: .Enredo)
        ]
        
    }
    
    func apurar(){
        for (_, umJurado) in jurados {
            for escola in escolas {
                umJurado.avaliar(escola)
            }
        }
    }
    
    func vencedora() -> EscolaDeSamba?{
        
        guard var vencedora = escolas.first else{
            return nil
        }
        
        for escola in escolas {
            if escola.notaFinal() > vencedora.notaFinal() {
                vencedora = escola
            }
        }
        
        return vencedora
    }
}

let escolas = [
    EscolaDeSamba(nome: "GoldenEagles"),
    EscolaDeSamba(nome: "GreenHouseEmpire"),
    EscolaDeSamba(nome: "HawksOfFaithful"),
    EscolaDeSamba(nome: "GayYouth"),
    EscolaDeSamba(nome: "HigherTone")
]

let carnaval2016 = Carnaval(escolas: escolas)
carnaval2016.apurar()

if let vencedora = carnaval2016.vencedora() {
    let nome = vencedora.nome
    let nota = String(format:"%.1f", vencedora.notaFinal() ?? 0.0)
    print("A vencedora foi \(nome) com \( nota )")
}
