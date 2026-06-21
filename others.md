# Other Flavors

```s
./flutterfire.sh --spooky
./flutterfire.sh --anzio
./flutterfire.sh --community

flutter run --flavor spooky --dart-define-from-file=env/spooky.json --target=lib/main_spooky.dart
flutter run --flavor anzio --dart-define-from-file=env/anzio.json --target=lib/main_anzio.dart

flutter build apk --release --flavor spooky --dart-define-from-file=env/spooky.json --target=lib/main_spooky.dart
flutter build apk --release --flavor anzio --dart-define-from-file=env/anzio.json --target=lib/main_anzio.dart

flutter build appbundle --release --flavor spooky --dart-define-from-file=env/spooky.json --target=lib/main_spooky.dart
flutter build appbundle --release --flavor anzio --dart-define-from-file=env/anzio.json --target=lib/main_anzio.dart
```
