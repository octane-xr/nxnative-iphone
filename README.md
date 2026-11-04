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
| **IPA de un juego** | ⛔ no generado | nxnative requiere TU juego (NSP/XCI + `prod.keys`) o un `.nup`; no hay launcher sin juego |
| Instalación en iPhone | ❓ no probada | requiere tu iPhone y tu Apple ID |
| Switch 2 en iPhone | ❓ no confirmado | ver `docs/SWITCH2_COMPATIBILITY.md` |

## Bloqueador real
nxnative **no** produce una app genérica: convierte un juego que tú posees en un IPA sin firmar. Un build de 30–60 min de un juego grande (≈2× su tamaño + 10 GB) no cabe en un runner gratuito de ~35 GB y subir juegos/claves a GitHub no es aceptable. Por eso la compilación real del juego debe ser local (Mac) o, desde Linux, queda **sin resolver**.

Documentación: [Linux](docs/LINUX_SETUP.md) · [Actions](docs/GITHUB_ACTIONS.md) · [Instalación iOS](docs/IOS_INSTALLATION.md) · [Switch 2](docs/SWITCH2_COMPATIBILITY.md) · [Problemas](docs/TROUBLESHOOTING.md)
