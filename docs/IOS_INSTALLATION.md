# Instalación en iPhone desde Linux
Probado el 2026-11-04 en Ubuntu 24.04 con un iPhone 15 Pro Max (iOS 26.6.2) y un Apple ID gratuito.

## Lo que SÍ funcionó (✅ verificado)
1. **Generar el IPA** con `build-game.yml` (ver `GITHUB_ACTIONS.md`).
2. **Generar `RomFS.img` en Linux** (Python puro, 2 min, 9,2 GB):
   `python3 -I dm/tools/romfs_image.py <dump>/updates/<versión>/romfs RomFS.img` (script de nxnative). Su tamaño e índice coinciden con el `romfs.id` del IPA.
3. **Firmar e instalar con [iloader](https://github.com/nab138/iloader)** v2.4.1 (AppImage): iniciar sesión con Apple ID e "Import IPA". Terminó con `InstallComplete`.
4. **Copiar los datos** con `scripts/push_romfs_linux.py` (pymobiledevice3 11.49.5): sube a `Documents/romfs.img.part` y renombra al terminar. Tamaño verificado en el teléfono.
   ```bash
   python3 -m venv ~/.venvs/pmd3 && ~/.venvs/pmd3/bin/pip install pymobiledevice3
   ~/.venvs/pmd3/bin/python scripts/push_romfs_linux.py <bundle_id> RomFS.img
   ```
   Nota: en iOS 26.6.2 la consulta `com.apple.disk_usage` se cuelga; el script no la usa.

## Lo que NO funcionó (❌)
- **Sideloader** (`Dadoum`, builds 1.0-pre4 y main de sept. 2026): *segmentation fault* al iniciar sesión. Reproducido con una cuenta falsa: Apple responde HTTP 503 a la primera petición de autenticación (issue #129 del proyecto).
- AltServer-Linux no se probó (último release 2022).

## Sin verificar (❓)
- Que el juego **arranque y sea jugable** en el A17 Pro. nxnative: Switch 2 en iPhone "untested".
- Renovación de la firma cada 7 días (Apple ID gratuito) y "Increased Memory Limit".

Mantén Apple ID, certificados y perfiles solo en local.
