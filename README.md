# Flutter Template Repository

This repository serves as a boilerplate for starting new Flutter projects efficiently. It provides a clean architecture setup, pre-configured features, and utility files to help you focus on building your application logic.

---

## Features

### 1. **Project Structure**

A well-organized folder structure:

```structure
lib/
  core/
    common/
      widgets/
      cubits/
    depandancy_injection/
      service_locator.dart
    enums/
      enums.dart
    network/
      dio_client.dart
      interceptors.dart
    usecase/
      usecase.dart
    utils/
      constants/
        api_constants.dart
        colors.dart
        enums.dart
        image_strings.dart
        sizes.dart
        text_strings.dart
      device/
        device_utility.dart
      errors/
        exceptions.dart
        firebase_auth_exceptions.dart
        firebase_exceptions.dart
        format_exceptions.dart
        platform_exceptions.dart
        shared_preferences_exception_helper.dart
      formatters/
        formatter.dart
      helpers/
        app_bloc_observer_helper.dart
        dio_exception_helper.dart
        helper_functions.dart
        logger_helper.dart
      theme/
        widget_themes/
          appbar_theme.dart
          bottom_sheet_theme.dart
          checkbox_theme.dart
          chip_theme.dart
          elevated_button_theme.dart
          outlined_button_theme.dart
          text_field_theme.dart
          text_theme.dart
        theme.dart
      validators/
        validation.dart
  l10n/
    app_localizations.dart
    ar.json
    en.json
  app.dart
  main.dart
```

### 2. **Navigation**

- **`go_router`** integrated for managing routes.
- Handles Bottom Navigation Bar and nested routes effortlessly.

### 3. **Deep Links**

- Supports dynamic deep linking with `go_router` and `uni_links`.
- Cross-platform configuration for Android and iOS.

### 4. **Localization**

- Supports multiple languages using `intl`.
- Dynamic language switching.

### 5. **Utilities and Helpers**

- Custom themes for UI components.
- Error handling and exception helpers.
- Device utilities for platform-specific checks.

---

## Getting Started

### 1. **Clone the Repository**

```bash
git clone https://github.com/mahmoodhamdi/Tempelate.git
cd flutter-template
```

### 2. **Install Dependencies**

Run the following command to fetch all dependencies:

```bash
flutter pub get
```

### 3. **Set Up Configuration**

1. Update API constants in `lib/core/utils/constants/api_constants.dart`.
2. Add your project-specific configurations in `service_locator.dart`.

### 4. **Run the Application**

```bash
flutter run
```

---

## Customization

### Adding New Routes

1. Define the route in `AppPages`
2. Add the corresponding screen widget.

Example:

```dart
GoRoute(
  path: '/new-screen',
  builder: (context, state) => NewScreen(),
),
```

### Adding New Localization Language

1. Create a new JSON file in `lib/l10n/` (e.g., `es.json` for Spanish).
2. Add translations in the JSON file.
3. Update `supportedLocales` in `lib/app.dart`

```dart
supportedLocales: const [
  Locale('en'),
  Locale('ar'),
  Locale('es'),
],
```

### Updating Dependencies

Keep dependencies up to date by running:

```bash
flutter pub upgrade
```

---

## Contribution

Feel free to open issues or submit pull requests to improve this template.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
