# Building Locally

To build locally on Linux, the following are required:

- Flutter
- FVM (optional)
- Rust (recommended)

Flutter can be installed as per [official documentation](https://docs.flutter.dev/get-started/install/linux) either as a snap, or manually via `git`. Ensure all linux dependencies are also installed (see [CD pipeline](.github/workflows/cd_main.yml) for more info).

[FVM](https://fvm.app/) is a Flutter version management tool used to pin a flutter version for the project. Although it is not strictly required when building locally, some scripts utilize FVM, while when contributing please ensure that you are running the correct Flutter version.

Finally, Rust can be installed via [rustup](https://www.rust-lang.org/tools/install).

Before compilation, run the script `sh bin/loca_generate.sh` to generate localizations files.

## macOS

The tool is developed on macOS, however it is not supported on macOS. To build on macOS, locally generate a macOS project via `fvm flutter create . --platforms=macos`, install pods via `cd macos && pod install` and run by selecting macOS as a target. For testing purposes, the Steam directory is hardcoded to `Downloads/_steam`.

## Rust

[super_drag_and_drop](https://pub.dev/packages/super_drag_and_drop) and [super_clipboard](https://pub.dev/packages/super_clipboard) use Rust internally. Although these plugins will automatically download precompiled binaries for linux, by installing Rust locally, the code will instead be compiled from source.

## How it works

When a program is added to the steam launcher, an entry is added to the database located at `{SteamDirectory}/userdata/{SteamUserId}/config/shortcuts.vdf`, while artwork is added to the folder `{SteamDirectory}/userdata/{SteamUserId}/config/grid/`. A program can be added via right-click context menu, Heroic Launcher, Lutris, Steam ROM Manager or directly using the launcher itself. Due to a program's launcher option, it is generally possible to infer the base application (i.e. Lutris).

Steam artwork consists of five images:

| Type       | Description                        | Filename        | Size     |
| ---------- | ---------------------------------- | --------------- | -------- |
| icon       | Program launcher                   | `{gameid}_icon` | 256x256  |
| cover      | Vertical box art                   | `{gameid}p`     | 600x900  |
| hero       | Horizontal details hero            | `{gameid}_hero` | 1290x620 |
| logo       | Horizontal logo on details view    | `{gameid}_logo` | 650x248  |
| banner     | Horizontal banner when last played | `{gameid}`      | 920x430  |

Artwork in `/grid/` can be easily modified, replaced and deleted without affecting the shortcut database. A reboot, however, of the steam launcher is required to see resulting changes.

`icon`, however, is a special case, and the path is coded into `shortcuts.vdf`. Currently icons can not be modified.
