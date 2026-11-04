# Preparación en Linux
Probado en Ubuntu 24.04 x86_64.
## GitHub CLI sin sudo (✅ probado)
```bash
V=2.103.3
curl -sL -o gh.tgz https://github.com/cli/cli/releases/download/v$V/gh_${V}_linux_amd64.tar.gz
curl -sL https://github.com/cli/cli/releases/download/v$V/gh_${V}_checksums.txt | grep linux_amd64.tar.gz | awk '{print $1"  gh.tgz"}' | sha256sum -c -
tar xzf gh.tgz && mkdir -p ~/.local/bin && cp gh_${V}_linux_amd64/bin/gh ~/.local/bin/
~/.local/bin/gh auth login -h github.com -p https -w -s workflow,repo
```
Las credenciales las gestiona GitHub vía navegador; nunca se pegan en un chat.
## Ejecutar workflows (✅ probado)
```bash
gh workflow run environment-check.yml
gh run watch   # o: gh run list
gh run download <id> -n compat-report
```
