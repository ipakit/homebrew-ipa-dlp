# homebrew-ipa-dlp

Homebrew tap for [ipa-dlp](https://github.com/ipakit/ipa-dlp) — a macOS
wrapper around [ipatool](https://github.com/majd/ipatool) and
[UnfairPlay](https://github.com/DrWhax/unfairplay) that downloads and decrypts
App Store IPAs for apps your Apple ID owns.

## Install

```sh
brew tap ipakit/ipa-dlp
brew install ipa-dlp
```

If Homebrew complains that the tap is untrusted (some Homebrew 7 builds gate
third-party taps), run `brew trust ipakit/ipa-dlp` and retry.

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
brew untap ipakit/ipa-dlp
```

Removing the formula does not delete anything ipa-dlp wrote under
`~/.local/share/ipa-dlp`, `~/Library/Caches/ipa-dlp`, or
`~/Library/Application Support/unfairplay`. Remove those by hand if you want a
clean slate.

## Requirements

Apple Silicon Mac, macOS with a working App Store / FairPlay enrollment, and an
Apple ID that owns or can obtain the requested apps. See the
[main README](https://github.com/ipakit/ipa-dlp#readme) for limitations and
legal notes.
