# Online Exam App

A modern, scalable Flutter application for conducting and taking online examinations — built with Clean Architecture, feature-first structure, and production-ready practices.

[![Flutter](https://img.shields.io/badge/Flutter-≥3.0-blue?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-≥3.0-blue?logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Clean%20Architecture-✓-success)](#architecture)
[![State%20Management](https://img.shields.io/badge/Bloc-orange)](#tech-stack)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Overview

Cross-platform mobile app that enables:

- Students → browse subjects, take timed exams
- Teachers/Admins → create & manage exams and questions
- Secure authentication with role-based access
- API integration, automatic grading & results (in progress)

## Architecture (Clean + Feature-first)
lib/
├── core/                  # Shared utilities, base classes, errors, constants, DI setup
├── features/
│   ├── auth/              # Login, register, secure storage, env config
│   ├── home/              # Subjects list, API integration, main dashboard
│   ├── profile/           # User profile view/edit, subjects functionality
│   └── questions/         # Exam flow, question handling & UI
├── app_section.dart       # Root widget, theme, routing
└── main.dart

Strong focus on separation of concerns, testability, and maintainability.

## Tech Stack

| Category              | Main Packages/Tools                                   |
|-----------------------|-------------------------------------------------------|
| UI                    | Flutter (Material), flutter_svg, skeletonizer         |
| State Management      | flutter_bloc + equatable                              |
| Dependency Injection  | injectable + get_it                                   |
| Networking            | dio + retrofit + pretty_dio_logger                    |
| Code Generation       | build_runner, retrofit_generator, json_serializable, injectable_generator, envied_generator |
| Secure Storage        | flutter_secure_storage                                |
| Environment           | envied                                                |
| UI Helpers            | percent_indicator, flutter_native_splash              |
| Testing               | flutter_test, bloc_test, mockito                      |

## Quick Start

```bash
# 1. Clone the repository
git clone https://github.com/AbdelrahmanAyman1/online_exam.git
cd online_exam

# 2. Get dependencies
flutter pub get

# 3. Generate code (very important — do this after model/usecase changes!)
flutter pub run build_runner build --delete-conflicting-outputs

# Optional: watch mode during development
# flutter pub run build_runner watch --delete-conflicting-outputs

# 4. Run the app
flutter run

Useful Commands
# Full clean + regenerate
flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

# Run tests
flutter test

# Analyze code
flutter analyze
