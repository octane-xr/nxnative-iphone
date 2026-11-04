#!/usr/bin/env python3
"""Copia RomFS.img a Documents/romfs.img de una app nxnative en un iPhone, desde Linux (pymobiledevice3).
Equivalente (no probado en macOS) a scripts/push_romfs.sh de nxnative, que usa `xcrun devicectl`.
Uso: push_romfs_linux.py <bundle_id> <RomFS.img> [--check]   (--check: solo mira espacio y la app)
"""
import asyncio, os, sys
from pymobiledevice3.lockdown import create_using_usbmux
from pymobiledevice3.services.house_arrest import HouseArrestService


async def main(bundle, img, check):
    ld = await create_using_usbmux()
    size = os.path.getsize(img)
    # No se consulta el espacio libre: en iOS 26.6.2 com.apple.disk_usage no responde y bloquea la sesion.
    print(f"imagen: {size/1e9:.1f} GB; comprueba que el iPhone tenga >{size/1e9+2:.0f} GB libres (Ajustes > General > Almacenamiento)")
    svc = await HouseArrestService.create(ld, bundle_id=bundle, documents_only=False) if hasattr(HouseArrestService, 'create') else None
    if svc is None: sys.exit("API de HouseArrestService distinta de la esperada")
    print("Documents actual:", await svc.listdir("/"))
    if check: return
    await svc.push(img, '/Documents/romfs.img.part')
    st = await svc.stat('/Documents/romfs.img.part')
    assert int(st['st_size']) == size, f"tamaño distinto: {st['st_size']} != {size}"
    await svc.rename('/Documents/romfs.img.part', '/Documents/romfs.img')   # nxnative solo usa una imagen completa
    print("OK: Documents/romfs.img copiado")

asyncio.run(main(sys.argv[1], sys.argv[2], '--check' in sys.argv))
