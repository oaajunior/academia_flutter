import 'fruta_covariant.dart';

abstract class Animal {
  //Nao preciso declarar abstract em um método que é
  //abstrato, basta nao declarar o corpo. Na verdade, nem posso. Diferente do
  //java.
  void comer(covariant Fruta fruta);
}

class Macaco extends Animal {
  //Supondo que o macaca só coma Banana eu nao posso declarar aqui no metodo
  //comer que o parametro agora é do tipo Banana ao invés de Fruta, porque
  //na classe pai foi declarado dessa forma, mesmo que Banana descenda de fruta
  //para fazer isso preciso declarar no método pai que o parametro fruta pode
  //receber uma covariant. Faça o teste, retire a keyword covariant do parametro
  //fruta acima para ver o erro no metodo comer abaixo.
  @override
  void comer(Banana banana) {}
}
