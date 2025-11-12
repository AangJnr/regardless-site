# Regardless Site

This project is a Flutter application for the Regardless site.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
  - [FVM (Flutter Version Manager)](#fvm-flutter-version-manager)
  - [Install Dependencies](#install-dependencies)
  - [Firebase Setup](#firebase-setup)
- [Running the Application](#running-the-application)
  - [Web](#web)
  - [Mobile (Android/iOS)](#mobile-androidios)
- [Project Structure](#project-structure)

## Prerequisites

Before you begin, ensure you have the following installed:

-   [Git](https://git-scm.com/downloads)
-   [FVM (Flutter Version Manager)](https://fvm.app/docs/getting_started/installation)

## Setup

### FVM (Flutter Version Manager)

This project uses FVM to manage its Flutter SDK version.

1.  **Install FVM:**
    If you haven't already, install FVM globally:
    ```bash
    dart pub global activate fvm
    ```

2.  **Install the project's Flutter version:**
    Navigate to the project root and run:
    ```bash
    fvm install
    ```
    This will install Flutter version `3.24.3` as specified in the `.fvmrc` file.

3.  **Use FVM for this project:**
    To ensure you're using the correct Flutter version for this project, run:
    ```bash
    fvm use
    ```
    This command will link the project to the installed Flutter SDK version.

### Install Dependencies

Once FVM is set up and the correct Flutter SDK is in use, install the project dependencies:

```bash
fvm flutter pub get
```

### Firebase Setup

This project integrates with Firebase. To set up Firebase locally:

1.  **Install Firebase CLI:**
    If you haven't already, install the Firebase CLI:
    ```bash
    npm install -g firebase-tools
    ```

2.  **Login to Firebase:**
    ```bash
    firebase login
    ```

3.  **Configure Firebase Project:**
    Ensure your local Firebase project is configured correctly. This project uses `firebase_options.dart` and `firebase.json`. You might need to run `flutterfire configure` if these files are not correctly set up for your Firebase project.

    *(Note: Specific instructions for your Firebase project setup might be needed here, e.g., creating a new project in the Firebase console, adding Android/iOS/Web apps, and downloading configuration files.)*

## Running the Application

### Web

To run the application on the web:

```bash
fvm flutter run -d chrome
```
Or, to build for web:
```bash
fvm flutter build web
```

### Mobile (Android/iOS)

To run the application on an Android emulator/device or iOS simulator/device:

1.  Ensure you have an Android device connected or an emulator running, or an iOS simulator running.
2.  Run the application:
    ```bash
    fvm flutter run
    ```

## Project Structure

The project follows a standard Flutter project structure with additional organization for UI, services, and data. Key directories include:

-   `lib/`: Contains the main Dart source code.
    -   `lib/app/`: Application-level configurations and services.
    -   `lib/data/`: Data models and related logic.
    -   `lib/ui/`: User interface components, views, and widgets.
-   `assets/`: Static assets like images.
-   `web/`: Web-specific files.
-   `android/`: Android-specific project files.
-   `ios/`: iOS-specific project files.

---
**Note:** This README provides a general setup guide. Depending on your development environment and specific project requirements, you might need additional configurations.