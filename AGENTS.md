# Project workflow

Repository: bluesiAn/slamdunk-site. Preserve its current visibility, history and source directory.
Read /Users/ian/Projects/CODEX_WORKFLOW.md when working on this Mac.
Inspect Git status before changes. Never overwrite unrelated work, force push, reset or clean user files.
After changes, run `bash .github/scripts/check-and-build.sh`, inspect the diff, commit only the task's files, push, and verify GitHub Actions.
The build produces `public-dist/` for publication; do not upload the repository root or private configuration.
Use only the existing verified Cloudflare project and deployment configuration. Never change DNS or create a duplicate site.
