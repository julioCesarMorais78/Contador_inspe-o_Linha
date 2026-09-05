# 📋 Contador de Inspeção (Flutter)

Um aplicativo em **Flutter** desenvolvido para auxílio no controle e registro de inspeções de peças em tempo real. O projeto demonstra a transição do uso de widgets estáticos (`StatelessWidget`) para widgets reativos com estado mutável (`StatefulWidget`).

---

## 🚀 Sobre o Projeto

O **Contador de Inspeção** tem como finalidade permitir o acompanhamento da contagem de peças aprovadas, captura do nome do operador/inspetor e gestão do histórico de inspeções.

### 🎯 Principais Aprendizados e Conceitos Aplicados:
* **`StatelessWidget` vs `StatefulWidget`:** Separação entre a estrutura estática do aplicativo (`ContadorApp`) e a tela com estado mutável (`TelaContador`).
* **Gerenciamento de Estado Local (`State`):** Utilização do objeto `_TelaContadorState` para preservar e manipular variáveis que mudam durante a execução.
* **Captura de Inputs (`TextEditingController`):** Manipulação e leitura dos dados digitados pelo usuário no campo de texto de forma reativa.

---

## 🛠️ Tecnologias Utilizadas

* **[Flutter](https://flutter.dev/)** - Framework para desenvolvimento multiplataforma.
* **[Dart](https://dart.dev/)** - Linguagem de programação reativa.

---

## 📦 Estrutura do Código (Visão Geral)

```dart
lib/
└── main.dart    # Ponto de entrada do app, configuração do MaterialApp e TelaContador
