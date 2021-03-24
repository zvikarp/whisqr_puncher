# Whisqr Puncher

## 💻 Development

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### 🏁 Prerequisites

* For developing on your local machine:
  * Make sure you have [Flutter 2.x](https://flutter.dev/) installed.
  * Run `flutter doctor` in your terminal to verify that everything is fine.

### 📱 Run

- Run `flutter pub get` from the project directory to import packages and assets.
- Run `flutter run` to run the app on your mobile device.
- After a change to the router, use the command `flutter packages pub run build_runner watch` to update the auto generated files.

### 🛠 Build

- To export an `.apk` file, run `flutter build apk`. To release to the play store it is better to use `flutter build bundle`.