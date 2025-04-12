# Manual

*Non-Steam Artwork* is a linux tool to update artwork for non-Steam programs. This tool is not affiliated with Valve Corporation, nor the Steam platform.

## Supported Artwork

Each program in the Steam library has five visual elements that can be customized:

| Element    | Number | Description                                                                           |
| ---------- | ------ | ------------------------------------------------------------------------------------- |
| hero       | 1      | Launcher icon visible left of the program's name in sidebar.                          |
| cover      | 2      | Vertical box cover (akin to a physical game box).                                     |
| background | 3      | Large rectangular background image on details page.                                   |
| logo       | 4      | Foreground logo on top of background. When not specified, the program's name is used. |
| icon*      | N/A    | Launcher icon visible in sidebar to the left of the program's name.                   |

\* icons are currently not supported.

![](https://raw.githubusercontent.com/defuncart/non_steam_artwork/main/docs/images/01.png)

## Getting Started

In Desktop mode, download the [latest release](https://github.com/defuncart/non_steam_artwork/releases/latest), extract the downloaded zip and run the application `non_steam_artwork/non_steam_artwork` via Steam or third party program (i.e. Lutris).

![](https://raw.githubusercontent.com/defuncart/non_steam_artwork/main/docs/images/02.png)

A couple of helpful tips are displayed when relevant:

- It is recommended to create a cache backup before editing artwork. When no backups are found, a prompt is displayed.
- When non-Steam programs are removed from Steam, the artwork remains in the cache. If any files can be deleted, a prompt is displayed.
- To automatically download artwork, an api key is required for SteamGridDB. If none has been entered, a prompt is displayed.

## Artwork Grid

Artwork is displayed in a grid, with each row consisting of a separate program, with the artwork types 'cover', 'background', 'logo', 'hero' displayed from left to right.

The programs can be filtered by
- search term
- program type

while the results can be sorted by
- date created
- name
- id

in ascending or descending order.

The program type defaults to 'other' when neither 'lutris, 'epic' nor 'roms' can be inferred. **Note** The algorithm for emulators is pretty basic, if you notice any issues, please submit feedback.

## Updating Artwork

The following options are available for all artwork types:

| Command               | Description                                                                       |
| --------------------- | --------------------------------------------------------------------------------- |
| Search on SteamGridDB | Searches for artwork using the program's name                                     |
| Paste                 | Pastes an image from clipboard. Only JPEG/PNG are supported, links not supported. |
| Delete                | Deletes the current image.                                                        |

In addition, artwork can be added by drag'n'drop PNG/JPG images.

The following options are specified for specific artwork types:

| Type       | Command           | Description                                                                                                     |
| ---------- | ----------------- | --------------------------------------------------------------------------------------------------------------- |
| background | Set as hero       | Copies background image for hero. Useful when both hero and background should be identical.                     |
| logo       | Create empty logo | Creates an empty logo. Useful when background already contains a logo, or program name should not be displayed. |
| hero       | Set as background | Copies hero image for background. Useful when both hero and background should be identical.                     |

After artwork has been updated, Steam needs to be re-started in order for changes to be visible.

### Search on SteamGridDB

When 'Search on SteamGridDB' option is chosen, the program's name is initially used as a search term. Depending on this user defined name, the correct artwork may not be found. Consider the program 'Firefox' which uses the colloquial name (instead of official 'Mozilla Firefox'). By default, SteamGridDB lists 'Firefox Reality' as the best first suggestion.

![](https://raw.githubusercontent.com/defuncart/non_steam_artwork/main/docs/images/03.png)

Artwork for 'Mozilla Firefox' can be loaded by either selecting the program from the dropdown menu, or manually updating the search term.

Note that as SteamGridDB is community-based, not all games nor artworks are available.

## Edit Logo Position

When a logo has an image, the following options are available:

| Type       | Command            | Description                                                |
| ---------- | ------------------ | ---------------------------------------------------------- |
| logo       | Edit logo position | Edits logo position and size relative to background image. |

![](https://raw.githubusercontent.com/defuncart/non_steam_artwork/main/docs/images/04.png)
