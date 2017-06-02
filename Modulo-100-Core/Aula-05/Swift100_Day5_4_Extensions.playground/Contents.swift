//: Extensions

// Extensions são uma maneira de incluir funcionalidades
// em classes que já existem, principalmente as do sistema

extension String {
    
    func sóVogais() -> String {
        let vogais = ["a","e","i","o","u"]
        let resposta = self.characters.filter{
            return vogais.contains(String($0))
        }
        return String(resposta)
    }
}

"Noooossaaa!".sóVogais()


// Mais um exemplo
extension Int {
    func faça(closure:(Int)->()){
        for i in 0..<abs(self){ // abs ---> converte para positivo
            closure(i)
        }
    }
}

3.faça{ indice in
    print("\(indice) Oi!")
}

5.faça{
    print("\($0) Oi!")
}



// Extensions + Protocols

protocol DaquelesOnOff{
    var ligado:Bool {get set}
    func tempoDeVida() -> Int
}

extension DaquelesOnOff{
    
    // mutating: indica que altera o valor das coisas
    mutating func liga(){
        ligado = true
    }
    
    mutating func desliga(){
        ligado = false
    }
}

class AspiradorDePó : DaquelesOnOff {
    var ligado: Bool = false
    
    func tempoDeVida() -> Int {
        return 10
    }
}

var meuAspiradorDePó = AspiradorDePó()
meuAspiradorDePó.liga()

