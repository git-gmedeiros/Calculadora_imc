// Classe que representa uma pessoa
import 'package:flutter/material.dart';

class Pessoa {
  // Variáveis
  double _peso;
  double _altura;
  String _sexo;
  double _imc;

  // Getter e Setter do nome
  double get peso {
    return _peso;
  }

  set peso(double peso) {
    this._peso = peso;
  }

  // Getter e Setter do nome
  double get altura {
    return _altura;
  }

  set altura(double altura) {
    this._altura = altura;
  }

  // Getter e Setter do sexo
  String get sexo {
    return _sexo;
  }

  set sexo(String sexo) {
    this._sexo = sexo;
  }

  //Getter e Setter do IMC
  double get imc {
    return _imc;
  }

  set imc(double imc) {
    this._imc = imc;
  }

  // Construtor
  Pessoa(this._peso, this._altura, this._sexo) {
    _imc = calcularImc();
  }

  // Método que calcula o IMC da pessoa
  double calcularImc() => peso / (altura * altura);

  //Criar e retornar um widgets de Text
  Text criarText(String texto, Color cor) {
    return Text("IMC = ${_imc.toStringAsPrecision(4)}\n $texto\n$_sexo",
        style:
            TextStyle(color: cor, fontWeight: FontWeight.bold, fontSize: 20.0),
        textAlign: TextAlign.center);
  }

  // Método que retorna uma classificação de acordo com o IMC
  classificar() {
    if (sexo == "Mulher") {
      if (_imc < 19.1) {
        return criarText("Abaixo do peso", Colors.blue);
      } else if (_imc < 25.8)
        return criarText("Peso normal", Colors.green);
      else if (_imc < 27.3)
        return criarText("Sobrepeso", Colors.yellow);
      else if (_imc < 32.3)
        return criarText("Obesidade grau 1", Colors.brown);
      else if (_imc < 35.0)
        return criarText("Obesidade grau 2", Colors.orange);
      else
        return criarText("Obesidade grau 3", Colors.red);
    } else if (sexo == "Homem") {
      if (_imc < 20.7)
        return criarText("Abaixo do peso", Colors.blue);
      else if (_imc < 26.4)
        return criarText("Peso normal", Colors.green);
      else if (_imc < 27.8)
        return criarText("Sobrepeso", Colors.yellow);
      else if (_imc < 31.1)
        return criarText("Obesidade grau 1", Colors.brown);
      else if (_imc < 35.5)
        return criarText("Obesidade grau 2", Colors.orange);
      else
        return criarText("Obesidade grau 3", Colors.red);
    }
  }
}
