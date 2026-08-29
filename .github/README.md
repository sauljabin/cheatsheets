# Personal cheatsheets

This repository contains personal command-line cheatsheets for [cheat][]. The
sheets are intended for macOS and Linux; commands that differ by operating
system are labeled explicitly.

## Installation

### Install `cheat`

With [Homebrew][] on macOS or Linux:

```sh
brew install cheat
```

For other installation methods, see the official [cheat installation guide][].

### Install these cheatsheets

First inspect the configured cheatpaths. The configuration file is usually at
`~/.config/cheat/conf.yml`.

For a first-time installation, create the default configuration:

```sh
mkdir -p "$HOME/.config/cheat"
cheat --init > "$HOME/.config/cheat/conf.yml"
```

Do not run that initialization command over an existing configuration. Then
inspect the configured paths:

```sh
cheat -d
```

Then clone this repository into the `personal` cheatpath:

```sh
mkdir -p "$HOME/.config/cheat/cheatsheets"
git clone https://github.com/sauljabin/cheatsheets.git \
  "$HOME/.config/cheat/cheatsheets/personal"
cheat -l -p personal
```

If your configuration uses a different directory, replace the clone destination
with the path shown by `cheat -d`.

### Install the optional aliases

The `alias` sheet can generate a file that works with both Bash and Zsh:

```sh
cheat alias > "$HOME/.aliases"
```

Add the following line to `~/.zshrc` or `~/.bashrc`, then restart the shell:

```sh
source "$HOME/.aliases"
```

The alias file provides fallbacks where macOS and Linux differ. Some shortcuts
are enabled only when their optional dependency is installed. Common optional
tools include `eza`, `kubecolor`, `watch`, `jq`, `lsof`, `uuidgen`, Docker, and
`kubectl`.

### Update

```sh
cheat --update
```

Alternatively, update only this repository:

```sh
git -C "$HOME/.config/cheat/cheatsheets/personal" pull --ff-only
```

Regenerate `~/.aliases` after updating if you installed the aliases:

```sh
cheat alias > "$HOME/.aliases"
```

## Usage

View a cheatsheet:

```sh
cheat git
```

View a cheatsheet from one cheatpath or all cheatpaths:

```sh
cheat -p personal git
cheat -a git
```

View configured cheatpaths and list available sheets:

```sh
cheat -d
cheat -l
cheat -l -p personal
```

Filter by a tag:

```sh
cheat -l -t networking
```

Search for text in all sheets:

```sh
cheat -s ssh
```

Search with a regular expression:

```sh
cheat -r -s '(?:[0-9]{1,3}\.){3}[0-9]{1,3}'
```

Flags can be combined. This searches the `personal` cheatpath for sheets tagged
`networking` that contain an IP address:

```sh
cheat -p personal -t networking -r -s '(?:[0-9]{1,3}\.){3}[0-9]{1,3}'
```

## Platform compatibility and safety

- Generic commands have been checked for macOS and Linux compatibility.
- Platform-specific examples mention macOS or Linux explicitly.
- Angle-bracket values such as `<project>` are placeholders and must be
  replaced; do not type the brackets literally.
- Availability still depends on the installed version of each CLI. Use
  `<command> --help` when a local version differs from a sheet.
- Commands that remove containers, volumes, credentials, or write directly to
  disks are destructive. Verify every target before running them.

## Format

Cheatsheets are plain-text files that begin with optional YAML front matter.
The header can assign tags and specify syntax highlighting.

```sh
---
syntax: bash
tags: [vcs, development]
---
# To stage all changes in the current directory:
git add --all

# To commit staged changes:
git commit -m <message>
```

Prefer [docopt][] syntax for placeholders. When that syntax could be confusing,
use obvious example values such as `foo.txt` or `example.com`.

## Contributing

Keep examples short, include a `# To ...:` description, label OS-specific
commands, and avoid embedding real account IDs, project IDs, secrets, or other
personal data.

## License

Cheatsheets are licensed under [Creative Commons CC0 1.0][cc0]. See [LICENSE][]
for the full license text.

## Other links

- [cheat][]
- [community cheatsheets][]
- [Homebrew][]

[LICENSE]: https://github.com/sauljabin/cheatsheets/blob/main/.github/LICENSE.md
[cc0]: https://creativecommons.org/publicdomain/zero/1.0/legalcode
[cheat]: https://github.com/cheat/cheat
[docopt]: https://docopt.org
[community cheatsheets]: https://github.com/cheat/cheatsheets
[cheat installation guide]: https://github.com/cheat/cheat/blob/master/INSTALLING.md
[Homebrew]: https://brew.sh
