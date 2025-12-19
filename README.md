# PuTTY Themer

> **Note:** This project is no longer maintained. It still works, but there are better alternatives today.

A Ruby script that applies the [Solarized Dark](http://ethanschoonover.com/solarized) colour scheme and [Fira Mono OT](http://www.carrois.com/fira-3-1/) font to all your saved PuTTY sessions via the Windows Registry.

## Why Archived?

This was written in 2011 when PuTTY was essential for SSH on Windows. The landscape has changed:

- **Windows now has built-in SSH** - `ssh user@host` works in PowerShell/Command Prompt
- **Windows Terminal** - Microsoft's modern terminal has native theming and SSH support
- **Requiring Ruby on Windows** - overkill for an 80-line script

## Alternatives

- **[Windows Terminal](https://github.com/microsoft/terminal)** - Modern terminal with built-in themes and SSH
- **[PuTTY Color Themes](https://github.com/AlexAkulov/putty-color-themes)** - Ready-made `.reg` files you can double-click to install
- **[4bit Terminal Color Scheme Designer](https://ciembor.github.io/4bit/)** - Generate custom PuTTY themes as `.reg` files

## If You Still Want to Use This

It still works. PuTTY's registry format hasn't changed.

```
ruby putty_sessions.rb
```

Requires Ruby with the `win32-registry` gem on Windows.

---

*Originally created 2011. Mass-themed approximately zero PuTTY sessions for its author, who switched to macOS the same year.*
