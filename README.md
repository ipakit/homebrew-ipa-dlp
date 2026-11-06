# homebrew-ipa-dlp

Homebrew tap for [ipa-dlp](https://github.com/bejminliou/ipa-dlp) — a macOS
wrapper around [ipatool](https://github.com/majd/ipatool) and
[UnfairPlay](https://github.com/DrWhax/unfairplay) that downloads and decrypts
App Store IPAs for apps your Apple ID owns.

## Install

```sh
brew tap bejminliou/ipa-dlp
brew trust bejminliou/ipa-dlp   # Homebrew 7+ asks before loading a third-party tap
brew install ipa-dlp
```

Then create the pinned tool copies and sign in:

```sh
ipa-dlp setup
```

## Use

```sh
ipa-dlp get spotify --version 9.1.88
```

The final path is printed on stdout. Account data is stripped by default.

## Double-clickable wizard

```sh
mkdir -p ~/Applications
cp "$(brew --prefix)/opt/ipa-dlp/share/ipa-dlp/ipa-dlp.command" ~/Applications/
chmod +x ~/Applications/ipa-dlp.command
```

## Upgrade

```sh
brew update && brew upgrade ipa-dlp
```

## Uninstall

```sh
brew uninstall ipa-dlp
brew untap bejminliou/ipa-dlp
```

Removing the formula does not delete anything ipa-dlp wrote under
`~/.local/share/ipa-dlp`, `~/Library/Caches/ipa-dlp`, or
`~/Library/Application Support/unfairplay`. Remove those by hand if you want a
clean slate.

## Requirements

Apple Silicon Mac, macOS with a working App Store / FairPlay enrollment, and an
Apple ID that owns or can obtain the requested apps. See the
[main README](https://github.com/bejminliou/ipa-dlp#readme) for limitations and
legal notes.
