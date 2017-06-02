//: Tuplas

var empresa = ("Quaddro", "3171-3080", "quaddro.com.br")
empresa.0
empresa.1
empresa.2

var httpResponse = (404,"Not Found")

var pessoa:(String,Int,Double) = ("Helena",5,0.78)
pessoa.0

let carro:(nome:String, ano:Int) = ("Fiat 147", 1996)
carro.nome
carro.ano

// typealias define um apelido para um tipo novo
typealias NomeCompleto = (nome:String, sobrenome:String) // Criar uma nova tipagem

let ken:NomeCompleto = ("Árthur Ken","Aramaki Mota")
ken.nome
ken.sobrenome

// Quick Fix
// 1. Faça uma Tupla Endereço com rua, numero, cidade
typealias Endereço = (rua:String, numero:Int, cidade:String)

// 2. Faça uma Tupla CPF com número e dígito verificador
typealias CPF = (numero:Int, digitoVerificador:Int)

let meuCPF: CPF = (123_456_789,10)
print("\(meuCPF.0)-\(meuCPF.1)")

// 3. Faça uma Tupla Pessoa com nome completo, endereço e CPF
typealias Pessoa = (
    nome:NomeCompleto,
    endereço:Endereço,
    cpf:CPF
)

var pessoa1:Pessoa = (("Ken","Aramaki"),("Av. Canadá",500,"Osasco"),(1234567,89))
print(pessoa1.endereço.0)
print(pessoa1.endereço.1)
print(pessoa1.endereço.2)

print("\(pessoa1.cpf.0)-\(pessoa1.cpf.1)")

var pessoa2:Pessoa
pessoa2.nome = ("Árthur","Mota")
pessoa2.cpf = meuCPF
pessoa2.endereço.cidade = "Osasco"
pessoa2.endereço.rua = "Rua Dona Maria"
pessoa2.endereço.numero = 151

