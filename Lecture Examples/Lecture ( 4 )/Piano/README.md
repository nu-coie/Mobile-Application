# Piano App 🎹

An interactive Flutter-based piano app that lets users play piano notes directly from their devices.
Features

    Play a variety of piano notes by tapping the keys.
    Realistic sounds for each piano key press.
    A sleek and simple UI for an immersive musical experience.
    Ability to play chords and melodies.

## Widgets Used

The app incorporates several of Flutter's widgets and an external package to emulate a piano:
## 1. SafeArea:

Prevents the UI from overlapping with the operating system's critical areas like the notch or the interactive edges.
## 2. Column:

Arranges the piano keys vertically to simulate the layout of a piano.
## 3. Expanded:

Used within Column or Row widgets to create piano keys that are responsive to the available space on different devices.
## 4. TextButton:

To create interactive keys on the piano. When pressed, it triggers the sound associated with that key.
## 5. Container:

Styling the individual piano keys with colors and borders to distinguish between different notes, such as white and black keys.
## 6. AudioPlayer (External Package):

Integrates audio playback functionality to produce the respective piano note sounds when keys are pressed.
## 7. Dart Function:

To define the logic of key presses, sound handling, and note duration.
## 8. Text:

Displays the note names on the keys or instructional text to assist users in playing the piano.

<img width="442" alt="Screenshot 2023-11-03 at 11 18 56 PM" src="https://github.com/nu-coie/Mobile-Applications/assets/107682899/f0174ed3-b422-465a-85a9-2386fdff7c60">
