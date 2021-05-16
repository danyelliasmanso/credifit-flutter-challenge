

import 'package:flutter_challenge/app/model/contaItau.dart';

class ValidadorContaItau {
  ContaItau conta;
  List<int> contaConvertida = [];

  ValidadorContaItau({conta});

  
  bool validarContaItau(ContaItau conta) {

    //Convertendo a string da agencia e conta sem o dígito em uma lista de inteiros
    for (var i = 0; i < 4; i++) {
      this.contaConvertida.add(int.parse(conta.agencia.substring(i, i + 1)));
    }
    for (var i = 0; i < 5; i++) {
      this.contaConvertida.add(int.parse(conta.conta.substring(i, i + 1)));
    }  
    
    List<int> produtosConta = [];
    int somaTotal = 0;
    int digito;

    //Armazena em uma lista dos os produtos das multiplicações
    for (int i = 0; i < 9; i++) {
      if (i % 2 != 0) {
          produtosConta.add(this.contaConvertida[i] * 1);
      } else {
        if (this.contaConvertida[i] >= 5) {
          String produto = (this.contaConvertida[i] * 2).toString();
          List<int> produtoMaiorQue10 = [
            int.parse(produto.substring(0, 1)),
            int.parse(produto.substring(1, 2))
          ];
          int produtoTransform = produtoMaiorQue10[0] + produtoMaiorQue10[1];
          produtosConta.add(produtoTransform);
        } else
          produtosConta.add(this.contaConvertida[i] * 2);
      }
    }

    //Somando todos os produtos das multiplicações
    for (int i = 0; i < produtosConta.length; i++) {
      somaTotal = somaTotal + produtosConta[i];
    }

    //Coletando o resto da divisão
    int resto = somaTotal % 10;

    //Verificando o valor do resto
    if (resto <= 9) {
      digito = 10 - resto;
    } else if (resto == 0) {
      digito = 0;
    } else if (resto > 9) {
      String strResto = resto.toString();
      List<int> intResto = [
        int.parse(strResto.substring(0, 1)),
        int.parse(strResto.substring(1, 2))
      ];
      digito = intResto[0] + intResto[1];
    }  

    //Validar dígito (Comparar digito calculado com dígito inserido)
    if (digito.toString() == conta.conta.substring(5, 6)) {
      return true;
    } else
      return false;
  }
}
