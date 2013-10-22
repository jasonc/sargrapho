#!/bin/bash

# This script installs SarGraphO.

# Allow the defaults to be overridden by environmental variables.
PREFIX=${PREFIX-"/opt/sargrapho"}
HTMLDIR=${HTMLDIR-"/var/www/html/sargrapho"}
GIT_REPO=${GIT_REPO-"https://github.com/jasonc/sargrapho.git"}
TGZ_URL=${TGZ_URL-"https://github.com/jasonc/sargrapho/tarball/master"}
HTTPD_CONF_DIR=${HTTPD_CONF_DIR-"/etc/httpd/conf.d"}
GIT_INSTALL=${GIT_INSTALL-false}

usage() {
  echo "Usage: [ HTMLDIR=/path ] [ PREFIX=/path ] $0" >&2
  echo "Installs SarGraphO." >&2
  echo "" >&2
  echo "Environmental variables:" >&2
  echo "  HTMLDIR   Configure sargrapho to output web pages in HTMLDIR." >&2
  echo "            Default value if not specified: ${HTMLDIR}" >&2
  echo "  PREFIX    Install files in PREFIX." >&2
  echo "            Default value if not specified: ${PREFIX}" >&2
  exit
}

[ $1 ] && usage 

# Install via git or tar.
if $GIT_INSTALL
then
  git clone $GIT_REPO $PREFIX || {
    echo "Could not git clone into ${PREFIX}."
    exit 1
  }
else
  # Create the install directory.
  mkdir -p $PREFIX 2>/dev/null || {
    echo "Could not create directory ${PREFIX}."
    exit 1
  }

  # Download and extract the tarball.
  curl -s -L $TGZ_URL | tar zxf - -C $PREFIX --strip-components=1
fi

# Create the configuration files.
sed -e "s#THE_PREFIX#${PREFIX}#g" -e "s#THE_HTMLDIR#${HTMLDIR}#g" ${PREFIX}/etc/sargrapho.conf.in > ${PREFIX}/etc/sargrapho.conf
rm ${PREFIX}/etc/sargrapho.conf.in 

sed "s#THE_HTMLDIR#${HTMLDIR}#g"  ${PREFIX}/etc/sargrapho-httpd.conf.in > ${PREFIX}/etc/sargrapho-httpd.conf
rm ${PREFIX}/etc/sargrapho-httpd.conf.in

# Symlink the apache config to $HTTPD_CONF_DIR if the directory exists and we
# have permissions to write to it.
if [ -d $HTTPD_CONF_DIR ] && [ -w $HTTPD_CONF_DIR ]
then
  ln -fs ${PREFIX}/etc/sargrapho-httpd.conf ${HTTPD_CONF_DIR}/
fi
