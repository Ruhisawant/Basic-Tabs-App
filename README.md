# Tabs Demo App

This is a Flutter app that demonstrates the use of `TabBar` and `TabBarView` widgets with different types of content in each tab. The app includes the following tabs:

1. **Text**: Displays a text input field where users can enter text, and the entered text is displayed below.
2. **Image**: Displays an image inside a `Card` widget.
3. **Button**: Shows a button that triggers an alert dialog when pressed.
4. **ListView**: Displays a simple `ListView` with several items.

## Features

- 4 tabs, each containing different content:
  - Text with a text field.
  - Image displayed in a card widget.
  - Button that shows an alert dialog.
  - ListView with multiple list items.
- Uses `TabController` to switch between tabs.
- App is structured using `StatefulWidget` for dynamic updates and state management.

## Getting Started

To run this app locally, follow these steps:

1. **Clone this repository**:
   ```bash
   git clone https://github.com/Ruhisawant/Basic-Tabs-App.git
   ```
   
2. **Navigate to the project directory**:
   ```bash
   cd tabs_app
   ```

3. **Install dependencies**:
   If you haven't installed Flutter, follow the installation guide here: [Flutter Install](https://flutter.dev/docs/get-started/install).

   Then, run the following command to install the required dependencies:
   ```bash
   flutter pub get
   ```

4. **Run the app**:
   Run the app on an emulator or connected device:
   ```bash
   flutter run
   ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.