# SundePhish Frontend

Flutter-based frontend for SundePhish.

# Usage

This is a Flutter project, so make sure you have the latest stable version installed. Next, install dependencies and run the app

```bash
# Install dependencies
flutter pub get

# Run or build the app
flutter run --dart-define=ID=XXX --dart-define=URL=YYY
flutter build web \
    --release \
    --web-renderer=canvaskit \
    --dart-define=ID=XXX \
    --dart-define=URL=YYY
```

Here, `ID` denotes the group ID. Choose a random string between 1 and 20 characters long. `URL` is the hostname of your deployed backend. For example, if you deployed your backend to `https://awesome-domain.com/`, then you need to run the app with `--dart-define=URL=awesome-domain.com`.

## Switching between campaigns

Each campaign is located under the `lib/providers` directory. At the top of the respective campaign folder, you will see two files, `<campaign>.screen.dart` and `<campaign>.theme.dart`. Former is the entry point, while the latter contains `ThemeData` definition for the current theme.

Typically, you would

1. Go to `pubspec.yaml` and uncomment **only** the `flutter_icons` key for the campaign you want to launch. Run `flutter pub run flutter_launcher_icons:main` to regenerate icons, favicon and `manifest.json` file.
2. Open to `lib/core/app.dart` app and make the following changes:

```dart
class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: campaignTheme,         // STEP 1: change to campaign theme in <campaign>.theme.dart
      darkTheme: campaignTheme,     // STEP 1: change to campaign theme in <campaign>.theme.dart
      home: const FacebookScreen(), // STEP 2: change to entry-point class in <campaign>.screen.dart
    );
  }
}
```

## License

Project is open-sourced under the MIT license.
