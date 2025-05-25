# Documentação do Projeto

## 1. Diagrama da Arquitetura do Aplicativo

O aplicativo segue a arquitetura baseada em camadas, utilizando o padrão BLoC para gerenciamento de estado. A estrutura principal é:

UI (Flutter) -> Bloc/Controller -> Repository/API -> Data/Database

- **UI**: Telas, widgets e componentes visuais.
- **BLoC/Controller**: Gerencia eventos, estados e lógica de negócio.
- **Repository/API**: Abstrai o acesso a dados (remoto/local).
- **Data/Database**: Persistência local (SQLite, SharedPreferences).

## 2. Fluxo de Dados Entre Componentes

1. O usuário interage com a UI (ex: botão).
2. A UI dispara um evento para o BLoC.
3. O BLoC processa o evento, acessa o repositório se necessário.
4. O repositório busca dados na API ou banco local.
5. O BLoC emite um novo estado.
6. A UI escuta o estado e atualiza a interface.

## 3. Descrição dos BLoCs/Controladores e Responsabilidades

- **AutenticacaoBloc**: Gerencia autenticação do usuário (login, logout, sessão).
- **Outros BLoCs**: Cada funcionalidade principal (ex: chamada, cadastro, listagem) possui seu próprio BLoC, responsável por processar eventos e emitir estados relacionados.

## 4. Instruções para Execução e Teste do Aplicativo

### Pré-requisitos
- Flutter SDK >= 3.7.0
- Dart SDK compatível

### Passos para execução
1. Instale as dependências:
   flutter pub get

2. Execute o aplicativo:
   flutter run

### Testes
- Para rodar os testes:
  flutter test

## 5. Desafios Encontrados e Soluções Implementadas

- **Gerenciamento de Estado**: Utilização do padrão BLoC para separar lógica de negócio da UI, facilitando manutenção e testes.
- **Persistência Local**: Integração com `sqflite` e `shared_preferences` para armazenamento eficiente de dados.
- **Navegação**: Uso do `go_router` para navegação declarativa e organizada.
- **Integração com API**: Abstração do acesso via repositórios, facilitando troca de fontes de dados.