//: Error Handling
// No Swift temos estruturas para permitir o tratamento de erros
// em tempo de execução

// Primeiro passo listar os possíveis erros
enum FalhaNaImpressão : ErrorType {
    case FaltouPapel
    case FaltouTinta
}

class Impressora {
    
    var qtdPapel:Int        = 0
    var nívelTinta:Double   = 0.0
    
    // throws indica que essa função pode gerar um error
    func imprimir (texto:String) throws {
        
        // garanta que qtdPapel seja maior que zero, senão...
        guard qtdPapel > 0 else {
            throw FalhaNaImpressão.FaltouPapel
        }
        
        // garanta que nívelTinta seja maior que zero, senão
        guard nívelTinta > 0 else {
            throw FalhaNaImpressão.FaltouTinta
        }
        
        print("Imprimindo... \(texto)")
        qtdPapel    -= 1
        nívelTinta  -= 0.01
    }
}


// 2) Agora vamos tratar o erro

let hp1505 = Impressora()

func tentaImprimir(texto:String) -> Bool {
    
    do {
        // tenta imprimir...
        try hp1505.imprimir(texto)
        return true
        
        // se não der...
    } catch FalhaNaImpressão.FaltouPapel{
        print("Precsaiva de papel! Vou reabastacer")
        hp1505.qtdPapel += 10
        return tentaImprimir(texto)
        
    } catch FalhaNaImpressão.FaltouTinta{
        print("Está sem tinta! Vamos trocar o cartucho")
        hp1505.nívelTinta = 1
        return tentaImprimir(texto)
        
    } catch {
        print("Erro ao imprimir")
        return false
    }
}

tentaImprimir("Teste de impressão")


// podemos utilizar try? para receber valores de função
// com throws. Nesse caso, quando há excpetion, o retorno é nulo

enum MathematicalError : ErrorType{
    case DividindoPorZero
}

func divide(a:Int,_ b:Int) throws -> Int {
    if b == 0 {
        throw MathematicalError.DividindoPorZero
    }else{
        return a/b
    }
}

let divisãoUm = try? divide(10, 2)
let divisãoDois = try? divide(10, 0)


