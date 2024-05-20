# openrndexternalsrc.bbclass provides GIT_TAG, GIT_COMMIT and GIT_HASH variables
# which can be used in SRCREV

GIT_TAG = "${@get_gitrev(d, 'tag')}"
GIT_COMMIT = "${@get_gitrev(d, 'commit')}"
GIT_HASH = "${@get_gitrev(d, 'hash')}"
GITSRCPV = "${@get_gitrev(d, 'srcpv')}"

def get_gitrev(d, part):

    import subprocess
    import re
    from functools import total_ordering
    from os import path

    tag=""
    commit=""
    hash=""
    gitrev=""
    is_tag_exist = True 

    srcdir = d.expand(d.getVar("EXTERNALSRC"))

    try:
        gitrev = subprocess.check_output(f"git --git-dir {srcdir}/.git describe HEAD", shell=True).strip().decode("utf-8")
    except subprocess.CalledProcessError:
        is_tag_exist = False
        gitrev = subprocess.check_output(f"git --git-dir {srcdir}/.git describe HEAD --always", shell=True).strip().decode("utf-8")


    if is_tag_exist:
        pattern = re.compile("(?P<tag>.*?)-(?P<commit>\d+)-g(?P<hash>[a-f0-9]+)")
        match = pattern.search(gitrev)
        if match:
            tag = match.group('tag')
            commit = match.group('commit')
            hash = match.group('hash')
        else:
            tag = gitrev 
    else:
        hash = gitrev

    if part == "tag":
        return tag
    elif part == "commit":
        return commit
    elif part == "hash":
        return hash
    elif part == "srcpv":
        return f"{tag}-{commit}-{hash}"
    else:
        return gitrev