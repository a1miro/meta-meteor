# openrndexternalsrc.bbclass provides GIT_TAG, GIT_COMMIT and GIT_HASH variables
# which can be used in SRCREV

GIT_TAG = "${@get_externalsrc_gitrev(d, 'tag')}"
GIT_MAJOR = "${@get_externalsrc_gitrev(d, 'major')}"
GIT_MINOR = "${@get_externalsrc_gitrev(d, 'minor')}"
GIT_PATCH = "${@get_externalsrc_gitrev(d, 'patch')}"
GIT_COMMIT = "${@get_externalsrc_gitrev(d, 'commit')}"
GIT_HASH = "${@get_externalsrc_gitrev(d, 'hash')}"
GITPV = "${@get_externalsrc_gitrev(d, 'pv')}"

def get_externalsrc_gitrev(d, part):
    import subprocess
    import re
    from functools import total_ordering

    srcdir = d.expand(d.getVar("EXTERNALSRC"))
    gitrev = subprocess.check_output("git --git-dir %s/.git describe HEAD --always" % (srcdir), shell=True).strip().decode("utf-8")

    pattern = re.compile("^[vV]?(?P<major>\d+)?\.?(?P<minor>\d+)?\.?(?P<patch>\*|\d+)?(?:-rc\d+)?-?(?P<commit>\d+)?-?(?P<githash>\w+)?$")
    match = pattern.search(gitrev)
    major, minor, patch, commit, githash = match.groups()

    tag = gitrev
    if commit:
      tag = tag.replace("-" + commit + "-" + githash, "")

    if part == "tag":
      return tag

    if part == "major":
      return major

    if part == "minor":
      return minor

    if part == "patch":
      return patch

    if part == "commit":
      return commit

    if part == "hash":
      return githash

    if part == "pv":
      return tag if not commit else str("%s+git%s+%s" % (tag,commit,githash))

