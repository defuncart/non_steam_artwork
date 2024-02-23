# non_steam_artwork

A linux tool to update artwork for non-steam programs.

## Features

- Clean up cached artwork not used
- Delete all cached artwork
- Manually delete individual artwork images
- New artwork via drag'n'drop/paste from clipboard
- Backup existing artwork to `Documents`

*Non-Steam Artwork* is not affiliated with Valve Corporation nor the Steam platform.

## Releases

The latest release can be found [here](https://github.com/defuncart/non_steam_artwork/releases/latest).

Extract the downloaded zip and run the application `non_steam_artwork/linux/non_steam_artwork` via Steam or third party program (i.e. Lutris). Flatpak releases may be considered once the tool becomes production ready.

## Expected Behavior & Known Issues

- Only tested on SteamOS, has not been tested on other linux distros.
- On Steam OS, system light/dark mode seems to default to light. Flutter/Steam OS issue.
- When there are multiple Steam user accounts, the first is selected.
- Only one file can dragged'n'dropped.
- Only jpeg and png files are allowed for drag'n'drop.
- Only images can be pasted, urls are not supported.

## Credits

Thanks to [PhilipK/](https://github.com/PhilipK/) for [steam_shortcuts_util](steam_shortcuts_util) which is used to parse `shortcuts.vdf`.

## Raising Issues and Contributing

Please report bugs and issues [here](https://github.com/defuncart/non_steam_artwork/issues).

To contribute, submit a PR with a detailed description and tests, if applicable.
