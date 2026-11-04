#!/usr/bin/env bash
# Genera un informe de compatibilidad del runner para nxnative. Uso: env_report.sh <repo_nxnative_dir> <salida.md>
set -uo pipefail
NX="${1:?dir nxnative}"; OUT="${2:?salida}"
sec() { printf '\n## %s\n\n```\n' "$1" >> "$OUT"; }
end() { printf '```\n' >> "$OUT"; }
run() { sec "$1"; shift; ( "$@" 2>&1 || echo "[fallo: exit $?]" ) >> "$OUT"; end; }
echo "# Informe de entorno (runner)" > "$OUT"
run "macOS" sw_vers
run "Arquitectura" uname -m
run "Xcode" bash -c 'xcode-select -p; xcodebuild -version'
run "SDK iOS" bash -c 'xcrun --sdk iphoneos --show-sdk-version; xcrun --sdk iphoneos --show-sdk-path; xcodebuild -showsdks | grep -i ios'
run "Compilador Metal" bash -c 'xcrun -f metal && xcrun metal --version'
run "Metal toolchain (xcodebuild)" bash -c 'xcodebuild -showComponent metalToolchain || true'
run "Python" bash -c 'python3 --version; which python3'
run "Disco" df -h /
run "Memoria (bytes) / CPU" bash -c 'sysctl -n hw.memsize; sysctl -n machdep.cpu.brand_string; sysctl -n hw.ncpu'
run "Dependencias de nxnative" bash -c 'for t in xcodegen zstd glslang dotnet brew git; do printf "%-10s " $t; (command -v $t && $t --version 2>&1 | head -1) || echo "NO INSTALADO"; done'
run "Commit de nxnative" git -C "$NX" log -1 --format='%H %cI %s'
run "Script de empaquetado presente" ls -la "$NX/scripts/build_ipa_from_nsp.py"
run "Opciones del script" python3 "$NX/scripts/build_ipa_from_nsp.py" --help
