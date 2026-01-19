# Online Exam App

[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/AbdelrahmanAyman1/online_exam)
[![Flutter](https://img.shields.io/badge/Flutter-≥3.0-blue?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-≥3.0-blue?logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Clean%20Architecture-✓-success)](#architecture)
[![State Management](https://img.shields.io/badge/Bloc-orange)](#tech-stack)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

An online examination application built with Flutter, designed for scalability and maintainability using Clean Architecture and a feature-first project structure.

## Overview

This is a cross-platform mobile application that provides a complete ecosystem for online exams. It allows users to register, log in, browse subjects, take timed exams, and view their results. The project is built with production-ready practices, including dependency injection, robust state management, and a clear separation of concerns.

## Features

-   **User Authentication**: Secure sign-up, sign-in, and password management (forgot password, reset password, change password).
-   **Subject & Exam Browsing**: Users can explore different subjects and view the exams available for each.
-   **Timed Exams**: A dedicated exam interface with a countdown timer, question navigation (next/previous), and answer selection.
-   **Automated Scoring**: Submit answers and receive an immediate score breakdown, including the number of correct and incorrect answers.
-   **Profile Management**: View and edit user profile information (username, name, email, phone) and change passwords securely.
-   **API Integration**: Communicates with a RESTful API for all data operations.

## Architecture

The project is structured using a combination of **Clean Architecture** and a **Feature-First** directory layout. This approach promotes separation of concerns, making the codebase easier to test, scale, and maintain.

```
lib
├── core
│   ├── api/          # DIO client, Retrofit setup, interceptors
│   ├── di/           # Dependency injection setup (GetIt, Injectable)
│   ├── error/        # Custom error handling
│   ├── helper/       # Utility helpers like SecureStorage
│   └── widgets/      # Common shared widgets
│
└── features
    ├── auth
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    ├── home
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    ├── profile
    │   ├── data/
    │   ├── domain/
    │   └── presenstation/
    └── questions
        ├── data/
        ├── domain/
        └── presentation/
```

-   **`core`**: Contains all the shared code, utilities, base classes, and configurations used across multiple features.
-   **`features`**: Each business feature (e.g., `auth`, `home`) is a self-contained module.
    -   **`presentation`**: The UI layer, containing Widgets and State Management (Bloc/Cubit). It depends only on the `domain` layer.
    -   **`domain`**: The core business logic, containing Entities, Use Cases, and Repository interfaces. It has no dependencies on other layers.
    -   **`data`**: The data layer, responsible for fetching data from remote (API) sources. It implements the repository interfaces from the `domain` layer.

## Tech Stack & Key Packages

| Category                 | Technology / Package                                                                                       |
| ------------------------ | ---------------------------------------------------------------------------------------------------------- |
| **State Management**     | `flutter_bloc`                                                                                             |
| **Dependency Injection** | `get_it`, `injectable`                                                                                     |
| **Networking**           | `dio` (HTTP Client), `retrofit` (Type-safe API client)                                                     |
| **Code Generation**      | `build_runner`, `injectable_generator`, `json_serializable`, `retrofit_generator`, `envied_generator`    |
| **Environment**          | `envied` (for managing environment variables like API base URLs)                                           |
| **Secure Storage**       | `flutter_secure_storage` (for storing authentication tokens)                                               |
| **UI**                   | `flutter_svg`, `skeletonizer` (for loading skeletons), `percent_indicator`                                 |
| **Testing**              | `bloc_test`, `mockito`                                                                                     |

## Getting Started

Follow these steps to get the project up and running on your local machine.

### Prerequisites

-   Flutter SDK (version >= 3.8.0)
-   Dart SDK (version >= 3.8.0)

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/AbdelrahmanAyman1/online_exam.git
    cd online_exam
    ```

2.  **Create the Environment File:**
    The project uses `envied` to manage environment variables. Create a file at `env/.env` and add the API base URL.
    ```
    # env/.env
    BASE_URL=https://exam.elevateegy.com/api/v1/
    ```

3.  **Get Flutter dependencies:**
    ```bash
    flutter pub get
    ```

4.  **Run Code Generation:**
    This is a critical step that generates files for dependency injection, networking, and data models.
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
    *Tip: For active development, you can use `watch` to automatically regenerate files on save:*
    ```bash
    flutter pub run build_runner watch --delete-conflicting-outputs
    ```

5.  **Run the application:**
    ```bash
    flutter run
    ```

## Running Tests

To run the unit and widget tests defined in the `test/` directory, use the following command:

```bash
flutter test
