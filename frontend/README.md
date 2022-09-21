# SundePhish Frontend

Flutter-based backend for SundePhish.

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

## License

Project is open-sourced under the MIT license.
