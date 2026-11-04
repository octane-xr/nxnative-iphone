# Instalación en iPhone desde Linux
**Estado: NINGÚN paso de esta página se ha probado** (no hay IPA ni acceso al iPhone). Distinguir:
1. **Firmar**: nxnative produce un IPA *sin firmar*. Hay que firmarlo con un certificado de desarrollo.
2. **Provisionar**: un Apple ID gratuito da perfiles de 7 días y pocos App IDs.
3. **Instalar**: por USB/Wi‑Fi con libimobiledevice / pymobiledevice3, o con SideStore.
4. **Ejecutar**: nxnative recomienda "Increased Memory Limit" para juegos grandes; no está verificado que un Apple ID gratuito pueda concederlo.

## Opciones (sin verificar con tu iPhone)
- **SideStore**: firma en el propio iPhone con Apple ID gratuito; la configuración inicial usa un archivo de emparejamiento que se genera desde un ordenador (existen herramientas para Linux). Consultar la guía vigente de SideStore.
- **AltServer-Linux / Sideloader (comunitarios)**: firman e instalan desde Linux con Apple ID gratuito. Verificar mantenimiento activo.
- **libimobiledevice / ideviceinstaller / pymobiledevice3**: instalan un IPA *ya firmado*; no firman.

Mantén tu Apple ID y certificados solo en local. Requisito de nxnative: iOS/iPadOS 26+ en A17 Pro o superior (tu 15 Pro Max cumple por hardware; comprueba tu versión de iOS).
