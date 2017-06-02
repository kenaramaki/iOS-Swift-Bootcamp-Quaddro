//: Enums
// Enumeradores são como listas de opções,
// utilizados amplamente para organizar o código
// e listar possibilidades

enum StatusDoPedido{
    case Feito
    case Faturado
    case EmSeparação
    case Enviado
    case Entregue
    case Cancelado
}

// Podemos listar os cases em uma linha
enum Classe {
    case Economica, Executiva, Primeira
}

// Podemos associar valores e extrair valores
enum ErrosHTTP : Int {
    case BadRequest     = 400
    case Unauthorized   = 401
    case Forbidden      = 403
    case NotFound       = 404
}

let codigoDoErro = ErrosHTTP.NotFound
print("Código do erro: \(codigoDoErro.rawValue)")
let novoErro = ErrosHTTP(rawValue:403)


// Quando o tipo é String, rawValue funciona também

enum CoberturasDeSorvete : String {
    case Maracujá
    case Chocolate
    case Manga
    case RomeuJulieta = "Romeu e Julieta"
}

var preferida = CoberturasDeSorvete.Chocolate
print("Minha preferida é: " + preferida.rawValue)
print("Minha preferida é também: " + CoberturasDeSorvete.RomeuJulieta.rawValue)

// Além disso, cada case no swift pode armazenar variáveis

enum StatusVeículo {
    case Estacionado
    case Movimentando(velocidade:Int)
}

class Fusca {
    var estado:StatusVeículo = .Estacionado
}


let meuFusca = Fusca()
print("Meu fusca está \(meuFusca.estado)")
meuFusca.estado = .Movimentando(velocidade: 80)
print("Agora meu fusca está \(meuFusca.estado)")

// Enums são perfeitos para se usar com switch

enum CorDeCarro : String {
    case Preto, Prata, Branco, Vermelho
}

let corDoMeuCarro:CorDeCarro = .Preto

switch corDoMeuCarro {
case .Preto:
    print("Parece Uber!")
case .Prata, .Vermelho:
    print("Fácil de vender!")
case .Branco:
    print("É carro de empresa?")
}

// e quando temos valores associados?
// sem problemas :D

switch meuFusca.estado {
case .Estacionado:
    print("Meu fusca está encostado.")
case .Movimentando(let velocidade):
    if velocidade < 60 {
        print("Andando, mas seguro 😗")
    }else {
        print("Cuidado! ⚠️")
    }

}

// Quick Fix
// 1) Faça um enum para representar os estados de um semáforo
// 2) Faça um enum para representar os estados de um jogador de futebol
// 3) Faça um enum de canais de TV, cujo tipo associado seja Int, com o número do canal
// 4) Faça um enum de marchas de um carro


// 1)
enum EstadosSemáforo {
    case Verde, Amarelo, Vermelho
}

let meuSemáforo:EstadosSemáforo = .Verde

switch meuSemáforo {
case .Verde:
    print("Avançar")
case .Amarelo:
    print("Atenção!")
case .Vermelho:
    print("Pare!")
}

// 2)
enum StatusDoJogador : String {
    case EmJogo         = "Em jogo"
    case ForaDaPartida  = "Fora da partida"
    case NãoConvocado   = "Não convocado"
    case NoBanco        = "No banco"
}

var ken = StatusDoJogador.EmJogo
print("Jogador Ken está " + ken.rawValue.lowercaseString)

// 3)

enum CanaisDaTV : Int {
    case Cultura  = 2
    case SBT      = 4
    case Globo    = 5
    case Band     = 13
    case Record   = 7
}

print("A \(CanaisDaTV.Cultura) fica no canal \(CanaisDaTV.Cultura.rawValue)")

print("No canal \(CanaisDaTV.Band.rawValue) é a \(CanaisDaTV(rawValue:13))")

// 4)
enum Marchas{
    case Primeira, Segunda, Terceira, Quarta, Quinta
    case Ré
}

// Por último, enums também tem métodos

enum Botão {
    case Ligado
    case Desligado
    
    mutating func troca(){
        if self == Desligado {
            self = Ligado
        }else{
            self = Desligado
        }
    }
}

var meuInterruptor = Botão.Ligado
meuInterruptor.troca()
print("O botão está: \(meuInterruptor)")

