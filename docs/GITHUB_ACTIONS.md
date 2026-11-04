# GitHub Actions
- Runner usado: `xcode-27` (macOS 27.0.1 arm64, vista previa; trae Xcode 27.0/27.1/27.2). nxnative pide Xcode 27.2, por eso `build-ios.yml` ejecuta `sudo xcode-select -s /Applications/Xcode_27.2.app`.
- **Coste:** los runners estándar son gratuitos en repos públicos. **No** usar etiquetas `-xlarge`/`-large` (de pago). (La política exacta de minutos de la etiqueta de vista previa no se verificó en la documentación de facturación; no se observó ningún cargo.)
- `environment-check.yml`: genera `report.md` (artefacto `compat-report`). ✅
- `build-ios.yml`: prepara todo sin contenido de Nintendo. No genera IPA. ✅
- Recursos del runner: ~7 GB RAM, ~35 GB de disco libre: insuficiente para juegos grandes.
