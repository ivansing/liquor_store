# 🚀 Setup and Installation Guide

## Prerequisites

Before setting up the project, ensure you have the following installed:

- **Flutter SDK** (>=2.17.0 <3.0.0)
- **Dart SDK** (included with Flutter)
- **Android SDK** (for Android development)
- **Xcode** (for iOS development - macOS only)
- **Git** for version control
- **VS Code** or **Android Studio** (recommended IDEs)

## 🛠️ Development Environment Setup

### Option 1: WSL2 + VS Code (Recommended for Windows)

#### 1. Install Flutter in WSL2

```bash
# Download Flutter SDK
cd ~/
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.7.12-stable.tar.xz
tar xf flutter_linux_3.7.12-stable.tar.xz

# Add Flutter to PATH
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.bashrc
source ~/.bashrc

# Verify installation
flutter doctor
```

#### 2. Install Android SDK (Command Line Tools)

```bash
# Create Android SDK directory
mkdir -p ~/Android/Sdk
cd ~/Android/Sdk

# Download Android command line tools
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
unzip commandlinetools-linux-9477386_latest.zip

# Create cmdline-tools directory structure
mkdir -p cmdline-tools/latest
mv cmdline-tools/* cmdline-tools/latest/
mv cmdline-tools/latest/cmdline-tools/* cmdline-tools/latest/
rmdir cmdline-tools/latest/cmdline-tools

# Install required Android packages
./cmdline-tools/latest/bin/sdkmanager --sdk_root=. \
  "platform-tools" \
  "platforms;android-33" \
  "build-tools;33.0.0" \
  "emulator" \
  "system-images;android-33;google_apis;x86_64"

# Set environment variables
echo 'export ANDROID_HOME=$HOME/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin' >> ~/.bashrc
source ~/.bashrc

# Accept licenses
flutter doctor --android-licenses
```

#### 3. VS Code Extensions

```bash
# Install Flutter extensions
code --install-extension Dart-Code.flutter
code --install-extension Dart-Code.dart-code
```

### Option 2: Traditional Setup (Windows/macOS/Linux)

#### Windows
1. Download Flutter SDK from [flutter.dev](https://flutter.dev)
2. Extract to `C:\flutter`
3. Add `C:\flutter\bin` to PATH
4. Install Android Studio
5. Install Flutter and Dart plugins

#### macOS
```bash
# Using Homebrew
brew install flutter

# Or download directly
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.7.12-stable.zip
unzip flutter_macos_3.7.12-stable.zip
export PATH="$PATH:`pwd`/flutter/bin"
```

#### Linux
```bash
# Download and extract
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.7.12-stable.tar.xz
tar xf flutter_linux_3.7.12-stable.tar.xz
export PATH="$PATH:`pwd`/flutter/bin"
```

## 📱 Project Setup

### 1. Clone the Repository

```bash
git clone [your-repository-url]
cd liquor_store
```

### 2. Install Dependencies

```bash
# Get Flutter packages
flutter pub get

# Generate model adapters (for Hive)
flutter packages pub run build_runner build
```

### 3. Verify Flutter Installation

```bash
flutter doctor
```

**Expected output should show:**
- ✅ Flutter (Channel stable, 3.7.12)
- ✅ Android toolchain
- ✅ VS Code (if using VS Code)
- ⚠️ Chrome (for web development)

## 🔥 Firebase Configuration

### 1. Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Create a new project
3. Enable the following services:
   - **Authentication** (Email/password, Google Sign-in)
   - **Cloud Firestore** (Database)
   - **Storage** (for images)

### 2. Android Configuration

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase in your project
firebase init
```

#### Add google-services.json
1. In Firebase Console, go to Project Settings
2. Add Android app with package name: `com.example.ecommerce_app`
3. Download `google-services.json`
4. Place it in `android/app/google-services.json`

### 3. iOS Configuration (if targeting iOS)

1. Add iOS app in Firebase Console
2. Download `GoogleService-Info.plist`
3. Add to `ios/Runner/GoogleService-Info.plist`

### 4. Configure Authentication

In Firebase Console → Authentication → Sign-in method:
- ✅ Enable Email/Password
- ✅ Enable Google Sign-in
- Add your app's SHA-1 certificate fingerprint

### 5. Firestore Database Setup

Create the following collections in Firestore:

```
Firestore Database
├── users/
│   └── [userId]
│       ├── email: string
│       ├── name: string
│       └── createdAt: timestamp
├── products/
│   └── [productId]
│       ├── name: string
│       ├── price: number
│       ├── description: string
│       ├── imageUrl: string
│       └── category: string
├── categories/
│   └── [categoryId]
│       ├── name: string
│       └── imageUrl: string
└── orders/
    └── [orderId]
        ├── userId: string
        ├── products: array
        ├── total: number
        └── createdAt: timestamp
```

## 🏃‍♂️ Running the Application

### 1. Check Available Devices

```bash
flutter devices
```

### 2. Run on Different Platforms

#### Web (Easiest for initial testing)
```bash
flutter run -d chrome
```

#### Android Emulator
```bash
# Create virtual device (first time only)
flutter emulators --create --name test_device

# Launch emulator
flutter emulators --launch test_device

# Run app
flutter run -d android
```

#### Android Physical Device
```bash
# Enable Developer Options and USB Debugging on device
# Connect device via USB

# Check device is recognized
adb devices

# Run app
flutter run
```

#### iOS Simulator (macOS only)
```bash
# Open simulator
open -a Simulator

# Run app
flutter run -d ios
```

## 🛠️ Development Tools

### Hot Reload
- Press `r` in terminal for hot reload
- Press `R` for hot restart
- Press `q` to quit

### Debug Mode
```bash
flutter run --debug
```

### Release Mode
```bash
flutter run --release
```

### Profile Mode
```bash
flutter run --profile
```

## 🐛 Troubleshooting

### Common Issues

#### 1. Flutter Doctor Issues
```bash
# Android license issues
flutter doctor --android-licenses

# Missing tools
flutter doctor
# Follow the suggestions provided
```

#### 2. Gradle Issues
```bash
# Clean build
flutter clean
flutter pub get

# Clear Gradle cache
cd android
./gradlew clean

# Return to root and run again
cd ..
flutter run
```

#### 3. Firebase Issues
- Verify `google-services.json` is in correct location
- Check package name matches Firebase configuration
- Ensure all required Firebase services are enabled

#### 4. Dependency Issues
```bash
# Clear pub cache
flutter pub cache repair

# Reinstall dependencies
flutter clean
flutter pub get
```

#### 5. Build Issues
```bash
# Regenerate build files
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Android Specific Issues

#### SDK Issues
```bash
# Update SDK components
flutter doctor
# Follow Android Studio suggestions or use command line:
sdkmanager --update
```

#### Emulator Issues
```bash
# List available system images
sdkmanager --list | grep system-images

# Create new AVD
avdmanager create avd -n test_device -k "system-images;android-33;google_apis;x86_64"
```

### VS Code Configuration

#### Settings.json
```json
{
  "dart.flutterSdkPath": "/path/to/flutter",
  "dart.debugExternalPackageLibraries": true,
  "dart.debugSdkLibraries": false
}
```

#### Launch.json for debugging
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Flutter",
      "type": "dart",
      "request": "launch",
      "program": "lib/main.dart"
    }
  ]
}
```

## 📦 Building for Production

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle (Recommended for Play Store)
```bash
flutter build appbundle --release
```

### iOS (macOS only)
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 🧪 Testing

### Run Unit Tests
```bash
flutter test
```

### Run Integration Tests
```bash
flutter drive --target=test_driver/app.dart
```

### Code Coverage
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## 📊 Performance Monitoring

### Flutter Inspector
- Available in VS Code Flutter extension
- Shows widget tree and performance metrics

### Performance Profiling
```bash
flutter run --profile
# Then use Flutter Inspector for performance analysis
```

## 🔧 Additional Configuration

### Environment Variables
Create `.env` file in project root:
```
FIREBASE_API_KEY=your_api_key
STRIPE_PUBLISHABLE_KEY=your_stripe_key
```

### Custom App Icons
```bash
# Install flutter_launcher_icons
flutter pub add dev:flutter_launcher_icons

# Configure in pubspec.yaml and run
flutter pub get
flutter pub run flutter_launcher_icons:main
```

### App Signing (Android)
1. Generate keystore
2. Configure `android/key.properties`
3. Update `android/app/build.gradle`

## 📝 Next Steps

After successful setup:

1. ✅ Verify app runs on at least one platform
2. ✅ Test Firebase authentication
3. ✅ Check Firestore data operations
4. ✅ Test offline functionality
5. ✅ Take screenshots for documentation
6. ✅ Set up version control
7. ✅ Configure CI/CD (optional)

## 🆘 Getting Help

- **Flutter Documentation**: [docs.flutter.dev](https://docs.flutter.dev)
- **Firebase Documentation**: [firebase.google.com/docs](https://firebase.google.com/docs)
- **Flutter Community**: [stackoverflow.com/questions/tagged/flutter](https://stackoverflow.com/questions/tagged/flutter)
- **GitHub Issues**: Check existing issues in the repository

---

**Note**: This setup guide assumes you're working with the existing project structure. Adjust Firebase configuration and package names according to your specific requirements.