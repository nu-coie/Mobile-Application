# Quote Explorer

A Flutter-based application that enables users to explore, search, and interact with inspirational quotes. The app supports multiple backends for data fetching and offers a seamless user experience with Firebase and REST API integration.

## Features

- **Quote Display**: View a curated collection of quotes with beautiful background images.
- **Search Functionality**: Search quotes by text or author.
- **Detail View**: Explore each quote with detailed information.
- **Actions**:
  - Share quotes via social media or messaging apps.
  - Copy quotes to the clipboard for easy sharing.
  - Bookmark favorite quotes (placeholder functionality).
- **Multi-Source Support**: Fetch quotes from Firebase Firestore or a REST API.

## Screens

1. **Home Screen (Firebase)**:
   - Fetches quotes from Firebase Firestore.
   - Displays a searchable list of quotes.

2. **Home Screen (REST API)**:
   - Fetches quotes from a REST API endpoint.
   - Displays a searchable list of quotes.

3. **Quote Details Screen**:
   - Shows detailed information about a selected quote.
   - Provides actions like sharing, copying, and bookmarking.

## Widgets Used

- **`Scaffold`**: For consistent screen structure.
- **`TextField`**: For search input.
- **`StreamBuilder` & `ListView.builder`**: For dynamic quote fetching and display.
- **`Image.network` & `ClipRRect`**: For displaying quote images with rounded corners.
- **`IconButton`**: For actionable buttons (share, copy, bookmark).

## Backends Supported

- **Firebase Firestore**: Real-time database for storing and retrieving quotes.
- **REST API**: Fetch quotes from a web server.

## How to Run the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/quote-explorer.git
   ```

2. Navigate to the project directory:
   ```bash
   cd quote-explorer
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Future Enhancements

- Add bookmark functionality.
- Implement offline support using local storage.
- Improve UI/UX with animations and transitions.

## License

This project is licensed under the [MIT License](LICENSE).
