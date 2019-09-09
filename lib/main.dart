import 'package:flutter/material.dart';
import 'Pessoa.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

enum SingingCharacter { homem, mulher }

class _HomeState extends State<Home> {
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Text _result;
  String _sexo = "Homem";

  SingingCharacter _character = SingingCharacter.homem;

  @override
  void initState() {
    super.initState();
    resetFields();
  }

  void resetFields() {
    _weightController.text = '';
    _heightController.text = '';
    setState(() {
      _result = Text("Informe seus dados",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue));
    });
  }

  void calculateImc() {
    Pessoa p1 = Pessoa(double.parse(_weightController.text),
        (double.parse(_heightController.text) / 100.0), _sexo);
    setState(() {
      _result = p1.classificar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                resetFields();
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    //Inicio button Radio
                    ListTile(
                      title: const Text('Homem'),
                      leading: Radio(
                        value: SingingCharacter.homem,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          setState(() {
                            _character = value;
                            _sexo = "Homem";
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Mulher'),
                      leading: Radio(
                        value: SingingCharacter.mulher,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          setState(() {
                            _character = value;
                            _sexo = "Mulher";
                          });
                        },
                      ),
                    ),

                    //TextForm do peso
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Peso (kg)'),
                      controller: _weightController,
                      validator: (text) {
                        return text.isEmpty ? "Insira seu peso!" : null;
                      },
                    ),

                    //TextForm da altura
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Altura (cm)'),
                      controller: _heightController,
                      validator: (text) {
                        return text.isEmpty ? "Insira sua altura!" : null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 36.0),
                      child: _result,
                    ),

                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 36.0),
                        child: Container(
                            height: 50,
                            child: RaisedButton(
                              color: Colors.blueAccent,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  calculateImc();
                                }
                              },
                              child: Text('CALCULAR',
                                  style: TextStyle(color: Colors.white)),
                            ))),
                  ],
                ))));
  }
}
