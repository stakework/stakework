#!/bin/bash

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

SKWD=${SKWD:-$BINDIR/stakeworkd}
SKWCLI=${SKWCLI:-$BINDIR/stakework-cli}
SKWTX=${SKWTX:-$BINDIR/stakework-tx}
SKWQT=${SKWQT:-$BINDIR/qt/stakework-qt}

[ ! -x $SKWD ] && echo "$SKWD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
SKWVER=($($SKWCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for stakeworkd if --version-string is not set,
# but has different outcomes for stakework-qt and stakework-cli.
echo "[COPYRIGHT]" > footer.h2m
$SKWD --version | sed -n '1!p' >> footer.h2m

for cmd in $SKWD $SKWCLI $SKWTX $SKWQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${SKWVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${SKWVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
