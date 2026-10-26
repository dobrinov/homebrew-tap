"""Bring Formula/<name>.rb (or, with --cask, Casks/<name>.rb) up to the
latest release of dobrinov/<name>.

The URLs and checksums are rewritten from the release's SHA256SUMS;
everything else (desc, caveats, test) stays as written.
Usage: python3 bump.py NAME [--cask]   (GITHUB_TOKEN raises the API rate limit)
"""
import json, os, re, sys, urllib.request

name = sys.argv[1]
cask = "--cask" in sys.argv[2:]
path = f"Casks/{name}.rb" if cask else f"Formula/{name}.rb"

def get(url):
    req = urllib.request.Request(url, headers={"Accept": "application/vnd.github+json"})
    if os.environ.get("GITHUB_TOKEN"):
        req.add_header("Authorization", "Bearer " + os.environ["GITHUB_TOKEN"])
    with urllib.request.urlopen(req) as r:
        return r.read().decode()

# the highest version, not GitHub's "latest" (the release created last,
# which is not the newest when two tags are built at once)
def key(r):
    return tuple(int(p) if p.isdigit() else 0 for p in r["tag_name"].lstrip("v").split(".")[:3])
releases = [r for r in json.loads(get(f"https://api.github.com/repos/dobrinov/{name}/releases?per_page=30"))
            if not r["draft"] and not r["prerelease"]]
if not releases:
    sys.exit(f"{name}: no releases")
rel = max(releases, key=key)
version = rel["tag_name"].lstrip("v")
sums_url = next((a["browser_download_url"] for a in rel["assets"] if a["name"] == "SHA256SUMS"), None)
if not sums_url:
    sys.exit(f"{name} {version}: no SHA256SUMS in the release yet")
sums = {}
for line in get(sums_url).splitlines():
    if line.strip():
        digest, file = line.split()
        sums[file.lstrip("*")] = digest

old = open(path).read()
current = re.search(r'^\s*version "([^"]+)"', old, re.M).group(1)
if current == version:
    print(f"{name} is current ({version})")
    sys.exit(0)

new = old.replace(f'version "{current}"', f'version "{version}"')
def url_and_sum(m):
    url = m.group(2).replace(current, version)
    file = url.rsplit("/", 1)[1]
    if file not in sums:
        sys.exit(f"{name} {version}: {file} is not in SHA256SUMS")
    return f'{m.group(1)}url "{url}"{m.group(3)}sha256 "{sums[file]}"'
if cask:
    # one sha256 before a url that names the version as #{version}
    file = re.search(r'^\s*url "([^"]+)"', new, re.M).group(1).rsplit("/", 1)[1]
    if file not in sums:
        sys.exit(f"{name} {version}: {file} is not in SHA256SUMS")
    new = re.sub(r'sha256 "[0-9a-f]+"', f'sha256 "{sums[file]}"', new, count=1)
else:
    new = re.sub(r'(\s*)url "([^"]+)"(\s+)sha256 "[0-9a-f]+"', url_and_sum, new)
open(path, "w").write(new)
print(f"{name}: {current} → {version}")
