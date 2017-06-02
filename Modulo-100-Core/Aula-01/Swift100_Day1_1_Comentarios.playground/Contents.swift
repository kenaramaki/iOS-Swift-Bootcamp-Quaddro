//: Comentários

// comentário de uma linha

/* 
 
 Comentario
 com mais de uma linha
 */

print("oi") // fim de linha
/* comeco de lina */ print("oi")
print(/*meio do codigo */"oi")

// comentarios com ':'
// = Markup do Playground
// ( Editor -> show render markup )

/**
    Função para soma de dois inteiros.
    Útil para:
    - demonstrar comentários
    - só
 - Parameter a: primeiro valor para somar
 - Parameter b: segundo valor para somar
 - Returns: resultado da conta
 */
func soma(a: Int, b: Int) -> Int {
    return a + b
}

// Quick
// documentar função

/**
    Função para dar Oi para uma pessoa.
    Útil para:
    - dar oi para pessoas
 - Parameter pessoa: o nome da pessoa a se dar oi
 - Returns: retorna Oi Pessoa
 */
func dizOiPara(pessoa:String) -> String {
    return "Oi" + pessoa
}

