import 'artista.dart';
import 'cantar.dart';
import 'dancar.dart';

//Mixin permite uma especie de heranca múltipla, onde eu
//posso extender de várias classes. Perceba aqui que só
//eu preciso usar a keyword with para poder ter essa herança.
//Perceba outra coisa, o mixin Dancar só declarado que só pode ser usado
//se a classe estender de Artista, ou seja, se a classe Joao abaixo não
//estender de Artista a classe Joao não poderá estender dela.
//Outra coisa muito importante, se todas as classes declararem o mesmo
//método, valerá apenas o método da última classe declarada na classe Joao,
//que neste caso é o método habilidade() da classe Cantar.
//Outra informacao crucial, se eu quiser implementar uma interface na classe
//Joao abaixo, ela teria que ser a ultima declaracao. Entao, ficaria assim:
//class Joao extends Artista with Dancar, Cantar implements IntefaceDesejada {}

class Joao extends Artista with Dancar, Cantar {}
