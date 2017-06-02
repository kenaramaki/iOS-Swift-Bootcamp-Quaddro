//: Typecast
// - Faça uma classe Midia, que tenha nome:String
// Agora faça uma classe Filme, que estende Midia e
// adiciona uma variável diretor:String
// Crie uma classe Música, que tenha artista:String e
// também estenda Midia
// Por último, faça uma função detalhes que recebe uma
// Midia e mostra: "<nome> de <autor>"

class Midia {
    var nome:String
    
    init(nome:String){
        self.nome = nome
    }
}

class Filme : Midia {
    var diretor:String
    init(nome: String, diretor:String) {
        self.diretor = diretor
        super.init(nome: nome)
    }
}

class Música : Midia {
    var artista:String
    init(nome: String, artista:String) {
        self.nome = nome
        self.artista = artista
    }
}




//: Error Handling
// - Faça uma classe "LinhaDeProdução"
// que tenha
// * funcionários:[String]
// * kitPeçasNoEstoque:Int
// iniciarTrabalhos(nomeFuncionario:String)
// gerarProduto() throws // remove uma peça do estoque
// Agora faça o tratamento de erros para:
// - Nenhum funcionário presente
// - Acabaram as peças

//: Protocols
// - Faça um protocolo Comestível, que tenha
// uma 'constante' gosto do tipo enum: Amargo, Doce, Salgado
// Agora modele as classes: Brigadeiro, Pastel e Giló

//: Extensions
// - Faça uma extensão de Int que diz que um número é par

// - Faça uma extension na string para retornar
// um vetor de letras, do tipo String!

// Generics - Faça uma função que embaralhe os elementos
// de um vetor de elementos genéricos

