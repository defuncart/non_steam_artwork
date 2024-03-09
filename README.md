# non_steam_artwork

A linux tool to update artwork for non-Steam programs.

## Features

- Clean up cached artwork not used
- Delete all cached artwork
- Manually delete individual artwork images
- New artwork via drag'n'drop/paste from clipboard
- With a SteamGridDB api key, artwork can be downloaded
- Backup existing artwork to `Documents`

Please see [manual](docs/manual.md) for a guide on getting started.

*Non-Steam Artwork* is not affiliated with Valve Corporation nor the Steam platform.

## Releases

The latest release can be found [here](https://github.com/defuncart/non_steam_artwork/releases/latest).

Extract the downloaded zip and run the application `non_steam_artwork/non_steam_artwork` via Steam or third party program (i.e. Lutris). Flatpak releases may be considered once the tool becomes production ready.

## Expected Behavior & Known Issues

- Only tested on SteamOS, has not been tested on other linux distros.
- On Steam OS, system light/dark mode seems to default to light. Flutter/Steam OS issue.
- When there are multiple Steam user accounts, the first is selected.
- Launcher icons can not be updated.
- Only one file can dragged'n'dropped.
- Only jpeg and png files are allowed for drag'n'drop.
- Only images can be pasted, urls are not supported.
- Image size is not optimized, same as source.
- Steam shortcuts (i.e. name) cannot be modified.
- Keyboard shortcuts are not optimized, TAB, CTRL+C etc. should work out of the box.

## Raising Issues and Contributing

Please report bugs and issues [here](https://github.com/defuncart/non_steam_artwork/issues).

To contribute, submit a PR with a detailed description and tests, if applicable.
