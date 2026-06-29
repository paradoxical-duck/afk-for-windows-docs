# AFK for Windows Docs

Firebase Hosting docs for AFK for Windows.

The Windows installer is deployed from `public/downloads/AFK-Setup-0.1.0.zip` but is intentionally ignored by Git because it is larger than GitHub's standard file limit. Firebase Spark hosting also blocks raw `.exe` downloads, so the public download is a ZIP containing the fixed installer.

Live site: https://afk-for-windows.web.app

## Commands

```powershell
npx firebase-tools deploy --only hosting
```

## Credits

Keshav Jindal (https://github.com/keshavatearth) created the original macOS app and inspired the Windows version.

