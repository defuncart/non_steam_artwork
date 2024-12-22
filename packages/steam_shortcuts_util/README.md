# steam_shortcuts_util

A utility to help manage your Steam shortcuts.

This library uses [flutter_rust_bridge](https://cjycode.com/flutter_rust_bridge/) to generates bindings so that the rust crate [steam_shortcuts_util](https://github.com/PhilipK/steam_shortcuts_util) can be called from dart code.

When [rust/src/api/simple.rs](rust/src/api/simple.rs) is edited, these bindings can be re-generated via `flutter_rust_bridge_codegen generate --watch`.

To update to a later version of `flutter_rust_bridge`, use `cargo install flutter_rust_bridge_codegen`.
