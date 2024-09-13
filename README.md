# UseDev: Teste Técnico

UseDev é um aplicativo móvel desenvolvido como parte do teste técnico para a vaga de Coordenador de Conteúdo Mobile na Alura. O aplicativo foi criado utilizando Flutter e tem como objetivo listar produtos e categorias a partir de requisições HTTP, permitindo a filtragem dos produtos pelo nome ou categoria.

## Índice

- [Descrição](#descrição)
- [Requisitos](#requisitos)
- [Instalação](#instalação)
- [Execução](#execução)
- [Ambientes de Execução](#ambientes-de-execução)
- [Arquitetura](#arquitetura)
- [Funcionalidades](#funcionalidades)
- [Endpoints](#endpoints)
- [Design](#design)
- [Testes](#testes)
- [Pipeline de CI](#pipeline-de-ci)
- [Considerações](#considerações)
- [Contato](#contato)

## Descrição

UseDev é um aplicativo móvel desenvolvido para Android com Flutter. Ele lista produtos e categorias obtidos via requisições HTTP, permitindo filtragem dos produtos por nome ou categoria diretamente no estado local do aplicativo. A interface do aplicativo é baseada no design fornecido no Figma, com o objetivo de ser o mais fiel possível ao protótipo visual.

## Requisitos

- Flutter SDK 3.24.3 ou superior
- Dart SDK 3.5.3 ou superior
- Android Studio ou Visual Studio Code com extensões Flutter
- Emulador Android ou dispositivo físico
- Java 21 (Oracle) para o build pipeline

## Instalação

1. Clone o repositório:

   ```bash
   git clone https://github.com/pretodev/usedev_app
   cd usedev_app
   ```

2. Instale as dependências do projeto:

   ```bash
   flutter pub get
   ```

## Execução

1. Conecte um dispositivo Android ou inicie um emulador.
2. Execute o aplicativo para o ambiente de desenvolvimento:

   ```bash
   flutter run --dart-define-from-file=env.dev.json
   ```

Para rodar em ambiente de produção, utilize:

```bash
flutter run --release --dart-define-from-file=env.prod.json
```

## Ambientes de Execução

O projeto possui dois ambientes de execução definidos no `launch.json`:

- **Dev**: Configuração para desenvolvimento local com o arquivo de configuração `env.dev.json`.
- **Produção**: Configuração para o ambiente de produção, utilizando o arquivo `env.prod.json` e rodando o aplicativo em modo release.

## Arquitetura

O projeto adota a arquitetura MVVM (Model-View-ViewModel) para garantir a separação clara entre a interface do usuário, a lógica de negócio e o acesso a dados. As dependências principais incluem:

- **firebase_core**: Integração com o Firebase para analytics e Crashlytics
- **flutter_svg**: Renderização de SVGs.
- **google_fonts**: Uso de fontes do Google.
- **result_dart**: Manipulação de resultados e erros.
- **http**: Para requisições HTTP.
- **auto_injector**: Injeção de dependências automatizada.
- **provider**: Gerenciamento de estado.

## Funcionalidades

- Listagem de categorias com dados obtidos via HTTP.
- Listagem de produtos com dados obtidos via HTTP.
- Filtragem de produtos por nome e categoria (aplicada localmente).
- Navegação entre telas de categorias e produtos.

## Endpoints

- **Categorias:** [Categorias JSON](https://gist.githubusercontent.com/viniciosneves/68bc50d055acb4ecc7356180131df477/raw/14369c7e25fca54941f5359299b3f4f118a573d6/usedev-categorias.json)
- **Produtos:** [Produtos JSON](https://gist.githubusercontent.com/viniciosneves/946cbbc91d0bc0e167eb6fd895a6b12a/raw/0f6661903360535587ebe583b959e84192cdb771/usedev-produtos.json)

## Design

O design do aplicativo segue o protótipo fornecido no Figma, com foco em uma implementação visual fiel ao design proposto.


## Pipeline de CI

O projeto utiliza um pipeline de CI configurado com GitHub Actions para automatizar o build e a distribuição do aplicativo Android:

- **Branch de desenvolvimento:** O pipeline é acionado em pushes e pull requests na branch `dev`.
- **Build Android Bundle:** Utiliza o Java 21 (Oracle) e Flutter 3.24.3 para construir o bundle Android.
- **Distribuição Firebase:** O bundle é enviado para o Firebase App Distribution, disponibilizando o aplicativo para o grupo de testers.

## Considerações

- O código segue os princípios SOLID e boas práticas de programação para garantir clareza, manutenção e expansão.
- Componentes são reutilizáveis para evitar duplicação de código e facilitar a manutenção.
- O aplicativo ainda não foi publicado na Google Play Store, mas será disponibilizado futuramente.

## Contato

Para mais informações ou esclarecimentos, entre em contato:

- **Nome:** Silas Ribeiro
- **Email:** santorsilasgmail.com
- **GitHub:** [github.com/pretodev](https://github.com/pretodev)

