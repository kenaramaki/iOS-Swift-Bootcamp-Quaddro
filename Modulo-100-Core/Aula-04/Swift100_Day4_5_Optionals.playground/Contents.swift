//: Optionals
// Um Optional diz:
// A) Existe um valor, e ele é igual a x
//  ou
// B) Não existe valor nenhum, no geral

class Time {
    var nome:String
    var gols:UInt
    var golsNosPenalties:UInt? // Inteiro, sem sinal, opcional
    
    init(nome:String){
        self.nome = nome
        self.gols = 0
        self.golsNosPenalties = nil
    }
}

let coringão = Time(nome:"Coringão")
coringão.golsNosPenalties = 3
print(coringão.golsNosPenalties)


// Estruturas para lidar com optionals

// 1) IF LET
// Verifica se um optional tem valor e, se sim, já desempacota (unwrap) o valor numa constante

func tevePenalties(time:Time){
    
    // Tenta desempacotar golsNosPenalties, opcional, na nova
    // constante chamada quantosPenalties
    if let quantosPenalties = time.golsNosPenalties {
        print("Teve, e foram \(quantosPenalties) gols do \(time.nome).")
    
    // se falhar, caso seja nil, cai no else
    }else{
        print("Não teve.")
    }
}

tevePenalties(coringão)

let vasco = Time(nome: "Vasco")
tevePenalties(vasco)

// > GUARD LET
// Implementação formal do pattern de early returning
// Usado quando precisamos validar variáveis que são 
// imprescindíveis na execução de uma função

func quemGanhouNosPenalties(a:Time, _ b:Time) -> Time? {
    
    // Garanta que eu consiga recuperar os valores
    // dos penalties para esta partida, senão
    // não temos mais o que fazer nessa função,
    // pode tratar o erro e retornar
    guard let penaltiesTimeA = a.golsNosPenalties,
          let penaltiesTimeB = b.golsNosPenalties else{
            print("Esse jogo não teve penalties.")
            return nil
    }
    
    if penaltiesTimeA > penaltiesTimeB {
        return a
    }else if penaltiesTimeA < penaltiesTimeB{
        return b
    }else{
        return nil
    }
}

quemGanhouNosPenalties(coringão, vasco)
vasco.golsNosPenalties = 0
print("Supondo que o Vasco tenha feito zero gols nos penalties")

if let ganhador = quemGanhouNosPenalties(coringão, vasco) {
    print("Quem ganhou foi \(ganhador.nome)")
}


// Dois detalhes:

// 1) Operador de Coalescência: podemos retirar o valor do optional
// rapidamente caso uma alternativa esteja disponível

var minhaCorFavorita:String? = nil
print("Minha cor favorita é \( minhaCorFavorita ?? "desconhecida" )")

minhaCorFavorita = "azul"
print("Minha cor favorita é \( minhaCorFavorita ?? "desconhecida" )")


// Force Unwrap: utilizado para forçar o desempacotamento
// Quando achamos que o valor sempre vai estar lá
// Atenção!!! Se não estiver => crash!
// Tipo: rm - rf

var idade:Int? = 30

if idade != nil {
    print("A idade é ", idade!) // Não fazer Force Unwrap
}



// Desafio
// http://pastebin.com/1C47nkvj
// http://pastebin.com/tnWB1GUT
// Dúvidas: luizgustavolino@gmail.com

