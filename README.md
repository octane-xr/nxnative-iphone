# nxnative-iphone

Infraestructura para probar [nxnative](https://github.com/seedds/nxnative) en iPhone usando **Linux + GitHub Actions** (sin Mac, sin Windows, coste $0).

## Estado (verificado con ejecuciones reales)

| Paso | Estado | Evidencia |
|---|---|---|
| Repos nxnative y NX2Apple existen (MIT, activos) | ✅ | API de GitHub |
| `environment-check` en runner `xcode-27` | ✅ | run 41888723738 |
| macOS 27.0.1, arm64 (M1 virtual, 3 CPU, 7 GB RAM, ~35 GB libres) | ✅ | informe `compat-report` |
| Xcode 27.1 por defecto; 27.2 instalado y seleccionable | ✅ | runs 41888723738 / 41888891919 |
| SDK iOS 27.1 y compilador Metal (32023.921) | ✅ | informe |
| `build-ios` (preparación: Xcode 27.2, Metal toolchain, dependencias, `--help` del script, shader Metal de prueba) | ✅ | run 41888891919 |
| **IPA de un juego (Donkey Kong Bananza, dump propio, Switch 2)** | ✅ generado (2,1 GB, zip válido) | run 41894405155: 7/7 etapas de nxnative, 23.638 shaders, 262 archivos compilados |
| Datos del juego (`RomFS.img`) en el iPhone | ❌ pendiente | el IPA se hizo con `--romfs separate`; la imagen quedó en el runner y se perdió |
| Firma e instalación en iPhone | ❓ no probada | requiere tu iPhone y tu Apple ID |
| Que el juego arranque en A17 Pro | ❓ no probado | nxnative: Switch 2 en iPhone "untested" |
| Switch 2 en iPhone | ❓ no confirmado | ver `docs/SWITCH2_COMPATIBILITY.md` |

## Cómo se logró el IPA sin Mac
El dump (19 GB) se sirvió desde un túnel temporal con token (`curl | tar` en el runner), `build-game.yml` compiló en `xcode-27` y el IPA salió cifrado como artefacto. El túnel y los secretos se borraron después. Ver `docs/GITHUB_ACTIONS.md`.

## Pendiente
Generar `RomFS.img` (herramientas Python de nxnative; no probado en Linux), firmar/instalar el IPA y copiar la imagen al iPhone. El script oficial `push_romfs.sh` usa `xcrun devicectl` (solo macOS), así que desde Linux habría que buscar otra vía.

Documentación: [Linux](docs/LINUX_SETUP.md) · [Actions](docs/GITHUB_ACTIONS.md) · [Instalación iOS](docs/IOS_INSTALLATION.md) · [Switch 2](docs/SWITCH2_COMPATIBILITY.md) · [Problemas](docs/TROUBLESHOOTING.md)
