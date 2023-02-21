# HACLT (Hypixel API Command Line Tool)

HACLT is a command-line tool for interacting with the Hypixel API. It allows you to query the Hypixel API for various information, such as player data or guild information, and filter the results using the powerful `jq` tool.

## Getting started

### Prerequisites

- Bash, Python, or Windows Command Prompt (cmd.exe)
- `jq` tool (available for [download](https://stedolan.github.io/jq/download/) on various platforms)

### Installation

1. Clone or download the repository to your local machine.
2. Ensure that the `jq` tool is installed on your system.
3. Run the script by navigating to the directory containing the script and typing `./haclt.sh`, `./haclt.py`, or `haclt.bat`, depending on which version you want to use.

### Usage

1. When prompted, enter your Hypixel API key. If you don't have one, you can obtain one from the Hypixel server by typing `/api` in the chat.
2. When prompted, enter the type of request you want to make (e.g. `player`, `guild`).
3. When prompted, enter any additional arguments you want to include in the request, such as a specific player name or guild ID.
4. When prompted, enter a `jq` filter string to filter the results. You can use the [official `jq` documentation](https://stedolan.github.io/jq/manual/) to learn more about how to use this powerful tool.

### Examples

Here are some example `jq` filters you can use to filter the results of your Hypixel API requests:

- `."player"."displayname"`: Get the player's display name.
- `."player"."stats"."Bedwars"."wins_bedwars"`: Get the player's Bedwars wins.
- `."guild"."name"`: Get the guild's name.
- `."guild"."memberCount"`: Get the number of members in the guild.

## Contributing

If you find a bug or have a feature request, please [open an issue](https://github.com/example/haclt/issues). If you want to contribute code, feel free to [open a pull request](https://github.com/example/haclt/pulls).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
