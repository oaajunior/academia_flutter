//Exemplo de como criar uma extension.
extension SaudacaoString on String {
  String saudacao() {
    return "Olá $this bem vindo ao dart.";
  }
}
