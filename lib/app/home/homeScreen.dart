  import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/model/contaBradesco.dart';
import 'package:flutter_challenge/app/model/contaItau.dart';
import 'package:flutter_challenge/app/validation/validationScreen.dart';
import 'package:flutter_challenge/app/validators/bradescoValidator.dart';
import 'package:flutter_challenge/app/validators/itauValidator.dart';



//Não foi montada a parte dos testes unitários, pois não tenho conhecimento nesta parte, porém, programadores estão em contante aprendizado,
//sendo assim, estou/estarei dispsto a aprender sobre teste unitários. Muito Obrigado!


  class HomeScreen extends StatefulWidget {
    @override
    _HomeScreenState createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> {


    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
    TextEditingController agenciaController = new TextEditingController();
    TextEditingController contaController = new TextEditingController();
    TextEditingController digitoController = new TextEditingController();


    int selected;

    setSelected(int value){
      setState(() {
        selected = value;
      });
    }

    @override
    void initState() {
      super.initState();
      selected = 1;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text("Validador de Contas Bancárias"),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
          color:  Theme.of(context).backgroundColor,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Container(
                width: 500,
                height: 300,
                child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(value: 1, groupValue: selected, activeColor: Theme.of(context).primaryColor, onChanged: (banco){
                             setSelected(banco);}), 
                            Text('237 - Banco Bradesco'),
                            Radio(value: 2, groupValue: selected, activeColor: Theme.of(context).primaryColor, onChanged: (banco){
                              setSelected(banco);}), 
                            Text('341 - Banco Itaú'),
                          ],
                      ),
                      Container(
                          width: 150,
                          child: TextField(
                            controller: agenciaController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Agência",
                            ),
                            maxLength: 4,
                          ),
                      ),
                      Row(
                        children: [
                          Container(
                              width: 150,
                              child: TextField(
                                controller: contaController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: "Conta",
                                ),
                                maxLength: selected == 1 ? 7 : 5,
                              ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                          width: 50,
                          child: TextField(
                            controller: digitoController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "DV",
                            ),
                            maxLength: 1,
                          ),
                      )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
                            ),
                            onPressed: (){
                              if(selected == 1){
                                ContaBradesco conta = new ContaBradesco();
                                conta.agencia = agenciaController.text;
                                conta.conta = contaController.text + digitoController.text;
                                ValidadorContaBradesco validador = new ValidadorContaBradesco();
                                if(validador.validarContaBradesco(conta)){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ValidationScreen()));
                                } else {
                                  // ignore: deprecated_member_use
                                  scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text('Conta Inválida!'), backgroundColor: Colors.red[700],));
                                }
                              } if(selected == 2) {
                                ContaItau conta = new ContaItau();
                                conta.agencia = agenciaController.text;
                                conta.conta = contaController.text + digitoController.text;
                                ValidadorContaItau validador = new ValidadorContaItau();
                                if(validador.validarContaItau(conta)){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ValidationScreen()));
                                } else {
                                  // ignore: deprecated_member_use
                                  scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text('Conta Inválida!'), backgroundColor: Colors.red[700],));
                                }

                              }
                            }, child: Text('Validar Conta')),
                        ],
                      )
                    ],
                  ),
                        ),
                ),
              ),
            ),
          ),
        )
        ,);}
  }