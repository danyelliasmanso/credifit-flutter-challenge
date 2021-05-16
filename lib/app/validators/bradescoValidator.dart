
import 'package:flutter_challenge/app/model/contaBradesco.dart';


//Validação de conta bancária do Banco Bradesco, nesta validação contém validação quando o dígito da conta for P, porém atualmente
//no site do bradesco não há a possibilidade de inserir letra no dígito da conta, possivelmente, o dígito P é de contas antigas. 

class ValidadorContaBradesco {
  ContaBradesco conta;
  List<int> contaConvertida = [];

  ValidadorContaBradesco({conta});

  bool validarContaBradesco(ContaBradesco conta) {
    contaConvertida.add(0);
    //Converte a conta em uma lista de inteiros para fazer as devidas multiplicações
    for (var i = 0; i < 7; i++) {
      this.contaConvertida.add(int.parse(conta.conta.substring(i, i + 1)));
    }

    List<int> produtosConta = [];
    int multiplicador = 7;
    int somaTotal = 0;
    int digito;
    String digitoP;

    for (var i = 0; i < 8; i++) {
       if (i == 0) {
        produtosConta.add(contaConvertida[i] * 3);
      } else if (i == 1) {
        produtosConta.add(contaConvertida[i] * 2);
      } 
      else {
        produtosConta.add(contaConvertida[i] * multiplicador);
        multiplicador--;
      }
    }

    //Somando todos os produtos das multiplicações
    for (int i = 0; i < produtosConta.length; i++) {
      somaTotal = somaTotal + produtosConta[i];
    }

    //Coletando o resto da divisão
    int resto = somaTotal % 11;

    //Verificando o valor do resto
    if (resto > 0 && resto != 1) {
      digito = 11 - resto;
    } else if (resto == 0) {
      digito = 0;
    }
    else if (resto == 1) {
      digitoP = 'P';
    }


    //Validar dígito (Comparar digito calculado com dígito inserido)
    
    if(resto != 1){
      if (digito.toString() == conta.conta.substring(7, 8)) {
        return true;
      } else
        return false;
    } else {
      if (digitoP == conta.conta.substring(7, 8)) {
        return true;
      } else
        return false;
    }
    
  }
}
