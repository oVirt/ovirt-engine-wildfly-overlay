#!/bin/sh

NAME="ovirt-engine-wildfly-overlay"

SCRIPTDIR="$(dir="$(readlink -f "$(dirname "$0")")/.." && cd "${dir}" && pwd)"
rm -rf "${SCRIPTDIR}/noarch" "${SCRIPTDIR}"/*.rpm "${SCRIPTDIR}"/*.tar.* "${SCRIPTDIR}"/*.jar

spectool --all --get-files --directory "${SCRIPTDIR}" "${SCRIPTDIR}/${NAME}.spec"

rpmbuild \
    -bs \
    --define="_sourcedir ${SCRIPTDIR}" \
    --define="_srcrpmdir ${SCRIPTDIR}" \
    --define="_rpmdir ${SCRIPTDIR}" \
    "${SCRIPTDIR}/${NAME}.spec"

# Install any build requirements
yum-builddep *src.rpm

# Build RPMs
rpmbuild \
    -D "_rpmdir $PWD/output" \
    -D "_topmdir $PWD/rpmbuild" \
    -D "release_suffix ${SUFFIX}" \
    --rebuild *.src.rpm

# Store any relevant artifacts in exported-artifacts for the ci system to
# archive
[[ -d exported-artifacts ]] || mkdir -p exported-artifacts
find . -iname \*rpm -exec mv "{}" exported-artifacts/ \;
