//: Closure

// No Swift funções podem ser atribuídas a variáveis
// Depois disso, podemos enviar estas variáveis por
// métodos e chamá-las sempre onde for preciso

// Closure: Pegar um trecho de código e colocar dentro de uma variável
// () -> () : não recebe, não retorna

// Exemplo de closure, sem parâmetros e sem retorno
// com inferência de tipo

let faladorDeOi = {
    print("Oi")
}

faladorDeOi()

// Exemplo de closure, sem parâmetro, com tipagem
let faladorDeTchau:()->() = {
    print("Tchau")
}

faladorDeTchau()

//
func repeteCincoVezes(closure:()->()){ // tipo do parâmetro: closure
    for _ in 1...5{
        closure()
    }
}

repeteCincoVezes(faladorDeTchau)
repeteCincoVezes(faladorDeOi)

repeteCincoVezes({print("closure")})


// Closure com parâmetro e retorno

let criadorDeBoaTarde:(paraQuem:String) -> String = { quem in
    return "Boa tarde, \(quem)"
}

criadorDeBoaTarde(paraQuem: "Ken")
criadorDeBoaTarde(paraQuem: "Helena")

//
func saudaçõesParaGeral( criador:(String)->(String)){
    let nomes = ["Ana","Maria","Braga"]
    for nome in nomes {
        let saudação = criador(nome)
        print(saudação)
    }
}

saudaçõesParaGeral(criadorDeBoaTarde)

// Closure da função soma
let soma:(Int, Int) -> (Int) = { v1, v2 in
    return v1 + v2
}

func executaOperação(v1:Int,_ v2:Int, operação:(Int,Int)->(Int)) -> Int {
    return operação(v1,v2)
}

executaOperação(130, 8, operação: soma)

// Quick Fix: Faça também subtração e multiplicação
let subtração:(Int,Int) -> (Int) = { v1, v2 in
    return v1 - v2
}

let multiplicação:(Int, Int) -> (Int) = { v1, v2 in
    return v1 * v2
}

executaOperação(10, 5, operação: subtração)
executaOperação(10, 5, operação: -)
executaOperação(10, 5, operação: multiplicação)
executaOperação(10, 5, operação: *)
executaOperação(10, 5, operação: soma)
executaOperação(10, 5, operação: +)

executaOperação(10, 5, operação: %)
executaOperação(10, 5, operação: /)

let 🤖:(Int,Int) -> (Int) = { // podemos omitir 'v1, v2 in'
    return max($0, $1)
}

executaOperação(10, 5, operação: 🤖)
