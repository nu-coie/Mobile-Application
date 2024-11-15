# Crypto Price Tracker 💰✨

A Flutter-based application that fetches and displays real-time cryptocurrency exchange rates for popular digital assets like Bitcoin, Ethereum, and Litecoin.

## Features

- Fetch real-time exchange rates for cryptocurrencies using the CoinAPI service.
- Support for multiple fiat currencies like USD, EUR, and JPY.
- Cross-platform compatibility with platform-specific UI elements (Material and Cupertino widgets).
- Interactive dropdown menu for selecting the preferred fiat currency.
- Seamless integration with APIs to ensure accurate and up-to-date information.

## Widgets Used

The app leverages Flutter's rich widget ecosystem and external packages to provide a responsive and intuitive user experience:

### 1. **MaterialApp**
Wraps the app to provide theming and navigational support.

### 2. **CupertinoPicker**
Platform-specific picker for iOS-style dropdowns, enhancing cross-platform usability.

### 3. **DropdownButton**
Interactive dropdown menu for selecting fiat currencies on Android devices.

### 4. **FutureBuilder**
Efficiently manages asynchronous data fetching and updates the UI when data changes.

### 5. **Container**
Used for styling and aligning UI components, like exchange rate cards.

### 6. **Map**
Stores exchange rate data for multiple cryptocurrencies, allowing dynamic updates.

### 7. **API Call (External)**
Uses the `http` package to make API requests and handle JSON responses for fetching cryptocurrency rates.

## API Integration

- The app communicates with CoinAPI to fetch real-time exchange rates using asynchronous Dart functions.
- Demonstrates efficient error handling for API calls to ensure a robust user experience.

## Notes

- Ensure you have a valid CoinAPI key to fetch data. Replace the placeholder in `API_Service.dart` with your key.
- 
![simulator_screenshot_8E624F2B-6DA8-4633-A790-3608A7BCCABF](https://github.com/user-attachments/assets/0dd634bb-4acf-41d7-8c0a-937a0f837fa8)
