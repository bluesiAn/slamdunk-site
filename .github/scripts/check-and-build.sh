#!/usr/bin/env bash
set -euo pipefail
if [[ "${OSTYPE:-}" == darwin* ]]; then
  scanner=/Users/ian/Projects/.tools/gitleaks-8.30.1/gitleaks
else
  scan_dir="$(mktemp -d)"
  trap 'rm -rf "$scan_dir"' EXIT
  curl --fail --silent --show-error --location --retry 3 --output "$scan_dir/gitleaks.tar.gz" https://github.com/gitleaks/gitleaks/releases/download/v8.30.1/gitleaks_8.30.1_linux_x64.tar.gz
  (cd "$scan_dir" && echo '551f6fc83ea457d62a0d98237cbad105af8d557003051f41f3e7ca7b3f2470eb  gitleaks.tar.gz' | sha256sum --check && tar -xzf gitleaks.tar.gz gitleaks)
  scanner="$scan_dir/gitleaks"
fi
"$scanner" git --redact --no-banner .
python3 .github/scripts/check_site.py . --build
