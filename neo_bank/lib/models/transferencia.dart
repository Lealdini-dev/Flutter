class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  toStringValor() {
    return 'R\$ $valor';
  }
  toStringConta() {
    return 'Conta: $numeroConta';
  }
}
