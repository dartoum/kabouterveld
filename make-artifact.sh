#!/bin/sh
# Maakt dist/artifact.html: index.html zonder het documentskelet (regels met <!--local-->),
# want het Artifact voegt doctype, charset en viewport zelf toe. Publiceer dat bestand.
cd "$(dirname "$0")" && mkdir -p dist && grep -v '<!--local-->' index.html > dist/artifact.html && echo "dist/artifact.html klaar"
