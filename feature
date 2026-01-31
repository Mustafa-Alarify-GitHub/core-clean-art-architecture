features/
└── auth/
    ├── data/
    │   ├── models/
    │   │   └── login_model.dart
    │   ├── datasources/
    │   │   └── auth_remote_datasource.dart
    │   └── repositories/
    │       └── auth_repository_impl.dart
    │
    ├── domain/
    │   ├── entities/
    │   │   └── user.dart
    │   ├── repositories/
    │   │   └── auth_repository.dart
    │   └── usecases/
    │       └── login_usecase.dart
    │
    └── presentation/
        ├── pages/
        │   └── login_page.dart
        ├── providers/
        │   └── auth_provider.dart
        └── widgets/
            └── login_form.dart
