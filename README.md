# 📱 IAFT Mobile

Aplicativo mobile desenvolvido em **Flutter** como parte do projeto **IAFT (Inovação, Automação e Ferramentas Tecnológicas)**, com foco educacional e acadêmico.

O aplicativo tem como objetivo centralizar informações, funcionalidades e interações relacionadas ao projeto IAFT, utilizando uma arquitetura organizada, interface moderna e boas práticas de desenvolvimento mobile.

Este README documenta **tudo o que é necessário para configurar, executar, avaliar e evoluir o projeto**.

---

## 🧰 Tecnologias Utilizadas

* **Flutter SDK** – framework multiplataforma
* **Dart** – linguagem de programação
* **Material Design** – padrão de interface
* **Firebase** (backend como serviço)

  * Firebase Authentication
  * Cloud Firestore
* **Git / GitHub** – controle de versão

---

## 🎯 Objetivo do Projeto

O **IAFT Mobile** foi desenvolvido com fins **educacionais**, visando:

* Facilitar a gestão da inseminação artificial por meio de uma plataforma digital 
* Promover a inclusão digital no agronegócio
* Reduzir falhas nos protocolos de inseminação artificial
* Capacitar os técnicos no uso de ferramentas digitais

---

## 📌 Pré-requisitos

Antes de executar o projeto, é necessário:

### 🔹 Flutter

* Versão recomendada: **>= 3.x.x**

```bash
flutter --version
```

### 🔹 Ambiente de Desenvolvimento

* **VS Code** (recomendado)

  * Extensões:

    * Flutter
    * Dart

ou

* **Android Studio**

### 🔹 Dispositivos

* Android Studio + Android SDK
* Emulador Android ou dispositivo físico
* (Opcional) iOS com macOS + Xcode

Verificação do ambiente:

```bash
flutter doctor
```

---

## 📂 Estrutura do Projeto

```text
lib/
 ├── main.dart                 # Inicialização do app
 ├── modules/                  # Módulos do sistema
 │   ├── auth/                 # Login e cadastro
 │   ├── home/                 # Tela inicial
 │   └── features/             # Funcionalidades do IAFT
 ├── services/                 # Serviços (Firebase)
 └── shared/                   # Código reutilizável
     ├── widgets/
     ├── colors/
     └── themes/

assets/
 ├── images/
 └── icons/

android/
ios/
pubspec.yaml
```

---

## 📦 Dependências Principais

As dependências do projeto estão declaradas no arquivo **pubspec.yaml**.

Principais pacotes utilizados:

```yaml
dependencies:
  flutter:
    sdk: flutter

  firebase_core: ^2.x.x
  firebase_auth: ^4.x.x
  cloud_firestore: ^4.x.x
```

Instalação das dependências:

```bash
flutter pub get
```

---

## 🔐 Firebase – Configuração

1. Criar um projeto no **Firebase Console**
2. Adicionar aplicativo Android
3. Baixar o arquivo `google-services.json`
4. Inserir em `android/app/`

Inicialização no `main.dart`:

```dart
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
```

---

## ▶️ Execução do Projeto

```bash
git clone https://github.com/iatf-mobile/iatf-mobile.git
cd iaft-mobile
flutter pub get
flutter run
```

---

## 📱 Funcionalidades

* Autenticação de usuários
* Navegação entre telas
* Integração com Firestore
* Interface responsiva
* Organização modular

---

## 🎨 Interface

* Material Design
* Tema global centralizado
* Cores padronizadas
* Componentes reutilizáveis

---

## 🧪 Testes

```bash
flutter test
```

---

## 🛠️ Build

### Android APK

```bash
flutter build apk
```

### Android AppBundle

```bash
flutter build appbundle
```

---

## 🚀 Boas Práticas Aplicadas

* Separação por módulos
* Reutilização de widgets
* Padronização de código
* Organização em camadas

---

## 🧑‍💻 Autores

**Pedro, Raislan Ítalo e Samuel**  
Projeto acadêmico – IAFT

---
