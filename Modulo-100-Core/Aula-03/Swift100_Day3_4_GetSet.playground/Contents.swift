//: Get Set
// é possível no Swift configurar um código para ser executado
// tanto antes, quanto depois da alteração de uma variável

class ContaBancária {
    
    let titular:String
    let numeroDaConta:String
    
    static var sequencia: Int =  1200
    
    var limite:Float{
        didSet{
            if limite < 0 {
                limite = 0
            }
        }
    }
    
    var saldo:Float {
        willSet{
            // newValue é uma variável *mágica*
            print("O novo saldo será de: \(newValue)")
        }
    }
    
    
    // Podemos criar 'computed properties'
    // além das 'stored properties'
    var disponívelParaSaque:Float {
        return saldo + limite
    }
    
    init(titular:String){
        self.titular = titular
        self.limite  = 300.0
        self.saldo   = 0.0
        
        // Criando um numero da conta à partir da variável
        // estática 'sequencia'
        self.numeroDaConta = "\(ContaBancária.sequencia)-10"
        ContaBancária.sequencia += 1
    }
    
    // Podemos criar mais de um init, por exemplo
    // passando menos parametros e assumindo valores padrão
    convenience init() {
        self.init(titular:"Anônimo")
    }
    
    convenience init(titular:String, valor:Float){
        self.init(titular:titular)
        self.saldo = valor
    }
}

let minhaConta = ContaBancária(titular: "Pedro")
minhaConta.limite = 1200
minhaConta.saldo = 48900
minhaConta.disponívelParaSaque
print(minhaConta.limite)
minhaConta.titular

let cc = ContaBancária(titular:"Ken", valor:1500)
cc.titular

print(minhaConta.numeroDaConta)
print(cc.numeroDaConta)
