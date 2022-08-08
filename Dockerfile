FROM debian:bullseye-slim

LABEL maintainer="Joel Nitta joelnitta@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive

# install apt dependencies
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    liblocale-gettext-perl \
    libtext-wrapi18n-perl \
    libunicode-linebreak-perl \
    libtest-pod-perl \
    libyaml-tiny-perl \
    libsyntax-keyword-try-perl \
    cpanminus \
    gettext \
    docbook-xml \
    docbook-xsl \
    docbook \
    xsltproc \
    texlive-binaries \
    texlive-latex-base \
    opensp \
    libsgmls-perl \
    wget \
    git \
    ca-certificates \
    make \
    build-essential

# install SGMLSpm
# cpanm http://search.cpan.org/CPAN/authors/id/R/RA/RAAB/SGMLSpm-1.1.tar.gz does not work
RUN mkdir working && \
  cd working && \
  update-ca-certificates && \
  wget https://cpan.metacpan.org/authors/id/R/RA/RAAB/SGMLSpm-1.1.tar.gz && \
  gunzip -c SGMLSpm-1.1.tar.gz | tar xv && \
  cd SGMLSpm-1.1 && \
  perl Makefile.PL && \
  make test && \
  make install && \
  cd ../.. && \
  rm -rf working

# install perl modules
RUN cpanm Locale::gettext \
  Text::WrapI18N \
  Unicode::GCString \
  Pod::Parser \
  Term::ReadKey \
  Module::Build

# Create /apps for installing software
ENV APPS_HOME /apps
RUN mkdir $APPS_HOME

# install po4a
RUN APPNAME=po4a && \
    VERSION=0.67 && \
    mkdir $APPS_HOME/$APPNAME && \
    cd $APPS_HOME/$APPNAME && \
    wget https://github.com/mquinson/$APPNAME/releases/download/v$VERSION/$APPNAME-$VERSION.tar.gz && \
    tar -xzf $APPNAME-$VERSION.tar.gz && \
    rm $APPNAME-$VERSION.tar.gz && \
    cd $APPNAME-$VERSION && \
    perl Build.PL && \
    ./Build && \
    ./Build install
