# Problemas
- `gh: command not found`: instalar según `LINUX_SETUP.md` y añadir `~/.local/bin` al PATH.
- Xcode 27.1 en lugar de 27.2: `sudo xcode-select -s /Applications/Xcode_27.2.app`.
- `xcrun: metal` falla: `xcodebuild -downloadComponent MetalToolchain`.
- Disco insuficiente en el runner (~35 GB): no construyas juegos grandes en Actions.
- No subas nunca `.nsp/.xci/.nup/prod.keys/*.ipa/*.p12/*.mobileprovision` (ya están en `.gitignore`).
