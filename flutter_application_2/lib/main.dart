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

    int _pecasAprovadas = 0;
    // variavel qeu gurada a contagem atual de peças aprovadas, começando com 0
    final _nomeController = TextEditingController();
    // TexteditingController é a ponte entre o que aparece na tela (Textfild)
    // e o nosso codigo dart. Guarda o texto digitado e o permite le-lo a qualquer momento em '_nomeController'. o final é pq o Controller em si nunca muda. ( sempre aponta para o mesmo objeto), quem muda é o texto dentro dele.

    final List<String>_registros=[];
    //  lista vazia de tetos que vai guardar a lista historica d eregistros de inpeção fechados no turno
    void _aprovarPeca() {
      // função chamada toda vez que o botão "+1 peça" é tocado pelo usuario
      setState((){
        // sempre que um dado do state muda, esta alteração precisa ocorrer dentro do setState para qeu o flutter saiba que precisa redesenhar a tela com um novo valor.

        _pecasAprovadas +=1;
        // incrementa a contagem de peças em 1

      });

    }

    void _registrarEZerar() {
    //funççao chamada quando o botão !registrar e zera" é tocado pelo usuario
    final nome = _nomeController.text.trim().isEmpty
        ? 'Sem nome'
        : _nomeController.text.trim();
        // operador ternario 
        // trim remove espaços em branco
        // se, depois disso o texto estiver vazio usamos "não informado, senão, usamos o nome digitado"

      setState((){
          // de novo, toda mudadnça do state entra no setState.
          _registros.add('$nome - $_pecasAprovadas peças(s)');
          // monta um texto combinando o nome e a contagem atual.
          // nterpolação de strings
          // adiciona este texto montado no final da lista de registros

          _pecasAprovadas = 0;
          //zera o contador para o inspetor começar a contar o proximo lote de peças


      });

    }
    @override
    void dispose() {
      // dispose é chamado pelo flutter quando a tela é removida da arvore de widget
      // ou seja, quando o usuario sai da tela.
      _nomeController.dispose();
      //libera recursos do controll (evita eixar memoria alocada em uso)

      super.dispose();
      // chama implementação original e nativa da classe pai
      // deve ser sempre a ultima linha da função dispose 
      // para garantir que tudo seja limpo corretamente.

    }

    @override
    Widget build(BuildContext context) {
      // monta e devolve a arvore de widgets que representa a tela no estado atual
      // ou seja com os valores atuais de peças aprovadas.
      return Scaffold(
          // esqueleto padrão de uma tela do flutter
          appBar:AppBar(
            title: Text('Inspeção de Peças'),
            // titulo fixo na barra do topo da tela

          ),
          body: Padding(
            // corpo da tela com espaçamento interno ao redor de todos os elementos
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // organiza todo o conteudo da tela verticalmente
              // nome, textos, numeros da contagem, botões, etc...
                children:[
                  TextField(
                    // campo de texto onde o inspetor digita o nome dele
                    controller: _nomeController,
                    // liga este campo ao contoller declarado lá em cima
                    // é assim que consiguimos ler o texto digitado
                    decoration: const InputDecoration(
                      labelText: 'Nome do Inspetor do Turno',
                      border:OutlineInputBorder(),
                      //  desenha  contorno ao redor da caixa de texto

                    ),
                    onChanged:(texto){
                      // é chamado pelo flutter toda vez que o ususrio digita ou apaga o caracter
                      setState((){
                        // chamamos o setState com um bloco vazio só para forçar a tela a se redesenhar. O dado em si (_nomeController.text) não mudou
                        // foi atualizado pelo controller, só precisa avisar o Flutter para reler esse valor no Text logo abaixo
                      });
                    },

                  ),
                  const SizedBox(height: 16),
                  // espaço vertical entre a linha de texto e a linha de responsavel
                  
                  Text(
                    _nomeController.text.trim().isEmpty
                    ? 'Responsável: Não Informado'
                    : 'Responsável: ${_nomeController.text.trim()}',
                    // operador ternario: se o campo ainda esta vazio
                    // mostramos um aviso, senão, mostramos o nome digitado
                    // interpolado dentro do texto em si
                    style: const TextStyle(fontSize:16, color:Colors.grey),

                  ),
                  const SizedBox(height: 16),
                  Text(
                    '$_pecasAprovadas',
                    style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    // fonte bem grande e em negrito para destacar o numero de contagem de peças


                  ),
                  Row(
                    // linha horizontal com os dois botões 
                    mainAxisAlignment: MainAxisAlignment.center,
                    // centraliza os botões do eixo principal da row (horizontal)
                    children:[
                      FilledButton.icon(
                        // estilo de botão já preenchido 
                        // será usado para aprovar a peça
                        onPressed: _aprovarPeca,
                        // quando tocado o botão chama a função aprovar peça
                        //essa é uma forma curta e abreviada de escrever: onPressed
                        icon: const Icon(Icons.add),
                        label: const Text('+1 Peça'),

                      ),
                      const SizedBox(width: 12),

                      OutlinedButton.icon(
                        // botão com apenas contorno, sem preenchimento
                        // usado para registrar apenas um ação secundaria qeu é registrar e zerar
                        onPressed: _registrarEZerar,
                        // ao tocar , chama a função registrarEZerar
                        icon: const Icon(Icons.save_alt),
                        label: const Text('Registrar e Zerar'),

                      ),
                      const SizedBox(width: 16),

                      const Align(
                        // posiciona seus filhos dentro do espaço disponivel
                        // vamos usar aqui para forçar o titula da lista para ficar alinhado a esquerda, mesmo estando dentro de uma row que centraliza os botões.
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'histórico do turno',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),

                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        // dentro da column o expanded força o espaço vertical disponivel restante
                        // é ele que dá a altura diponivel/ restante para rolar
                      child: _registros.isEmpty
                      ? const Center(child: Text('Nenhum registro ainda'))
                      : ListView.builder(
                        itemCount: _registros.length,
                        itemBuilder:(context, index) {
                          // ListView.bulder é um widget que constroi uma lista rolavel
                          return Card(
                            child: ListTile(
                              // leading é o icone a esquerda do texto
                              title: Text(_registros[index]),
                              //title é o texto principal do item da lista.
                            )
                          );
                        }
                          
                      ),

                      )

                    ],

                  ),




                ],

            ),

          ),



      );
    }

  }
