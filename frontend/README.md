# SundePhish Frontend

Flutter-based backend for SundePhish.

# Usage

This is a Flutter project, so make sure you have the latest stable version installed. Next, install dependencies and run the app

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run --dart-define=URL=XXX
```

You need to provide `URL` via `--dart-define` because that will be used as a base hostname where your backend is hosted/running from.

For example, if you deployed your backend to `https://awesome-domain.com/`, then you need to run the app with `--dart-define=URL=awesome-domain.com`

## License

Project is open-sourced under the MIT license.
