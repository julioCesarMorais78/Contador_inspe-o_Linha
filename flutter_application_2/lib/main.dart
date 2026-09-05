import 'package:flutter/material.dart';

void main() {
  runApp(const ContadorApp());
  // liga o motor do flutter e entrega o widget raiz (ContadorApp)
}

class ContadorApp extends StatelessWidget {
  // essa classe é só uma casca de configuração do App, ela não guarda nenhum //dado, por isso é StatelessWidget

  const ContadorApp({super.key});
  // construtor, repassando a key para o widget pai identifica-la

  @override
  Widget build(BuildContext context) {
    // monta e devolve a configuração geral do aplicativo
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contador de Inspeção',
      // titulo interno do App
      home:const TelaContador(),
      // A tela inicial do App é o widget TelaContador, definido logo abaixo

    );
  }
}

class TelaContador extends StatefulWidget {
  // isso é novo em realação ao projeto 1 (cracha)
  // Agora, a tela precisa lembrar de dados qeue mudam (a contagem, o nome, o historico.) Esta classe ainda não esta guardadno nada sozinha,mas ela já declara que existe um state associado a ela.

  const TelaContador({super.key});

  @override
  State<TelaContador> createState() => _TelaContadorState();
  //createstate é o metodo que o Flutter chama para criar o objeto de estado (tela contador state) ligado a este widget.
  }
  class _TelaContadorState extends State<TelaContador> {
    // esta é a classe que efetivamente gurda os dados qeu podem mudar durante o uso do app. Funciona como um cop e sobrevive entre uma recosntrução e outra das telas

    int _pecasaprovadas = 0;
    // variavel qeu gurada a contagem atual de peças aprovadas, começando com 0
    final _nomeController = TextEditingController();
    // TexteditingController é a ponte entre o que aparece na tela (Textfild)
    // e o nosso codigo dart. Guarda o texto digitado e o permite le-lo a qualquer momento em '_nomeController'. o final é pq o Controller em si nunca muda. ( sempre aponta para o mesmo objeto), quem muda é o texto dentro dele.

  }
