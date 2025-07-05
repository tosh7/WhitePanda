# WhitePanda

A golf counter app for iOS and Apple Watch that helps golfers track their rounds and scores.

## Features

- **iPhone App**: Main interface for creating new rounds and viewing past results
- **Apple Watch App**: Companion app for on-the-go score tracking during rounds  
- **Round Types**: Support for half rounds (9 holes) and full rounds (18 holes)
- **Score Tracking**: Count and track individual hole scores
- **Watch Connectivity**: Seamless data synchronization between iPhone and Apple Watch
- **Past Results**: View and review previous golf rounds
- **Real-time Updates**: Live score updates using The Composable Architecture

## Architecture

- **SwiftUI**: Modern declarative UI framework
- **The Composable Architecture (TCA)**: State management and app architecture
- **WatchConnectivity**: Communication between iPhone and Apple Watch
- **CommonModel**: Shared Swift Package for data models between targets

## Project Structure

```
WhitePanda/
├── WhitePanda/                    # iPhone app
│   ├── Scenes/
│   │   ├── Home/                  # Main home screen
│   │   ├── Result/                # Score results view
│   │   └── PastResults/           # Historical rounds
│   └── Models/
│       └── iPhoneConnecter.swift  # Watch connectivity
├── WhitePanda Watch App/          # Apple Watch app
│   ├── Scenes/
│   │   ├── Initial/               # Watch app entry point
│   │   ├── Counter/               # Score counting interface
│   │   ├── Round/                 # Round management
│   │   └── FreeCounter/           # Free counting mode
│   └── Models/
│       └── WatchConnecter.swift   # iPhone connectivity
└── CommonModel/                   # Shared Swift Package
    └── Sources/
        ├── RoundModel.swift       # Golf round data model
        └── RoundType.swift        # Round type definitions
```

## Requirements

- Xcode 15.3.0 or later
- iOS 17.0+
- watchOS 6.0+
- Swift 5.10+

## Installation

1. Clone the repository
2. Open `WhitePanda.xcworkspace` in Xcode
3. Build and run the project

## Usage

1. **iPhone**: Launch the app and tap "Create New Round" to start a new golf round
2. **Apple Watch**: The companion app will automatically sync and provide score tracking functionality
3. **During Play**: Use the Apple Watch app to quickly increment scores for each hole
4. **After Play**: Review your completed round and total score on either device
