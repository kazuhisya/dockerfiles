# vi: set ft=dockerfile :

FROM alpine:3.7
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

# port
EXPOSE 3000

# env
ENV REDMINE_VERSION="3.4.4" \
    IPAFONT_VERSION="00303" \
    TZ="JST-9"

# apk
RUN apk update && apk add \
        automake bash build-base curl \
        gcc git imagemagick6 imagemagick6-dev \
        libxml2-dev libxslt-dev linux-headers \
        make readline-dev \
        ruby ruby-bigdecimal ruby-bundler ruby-dev ruby-json \
        sqlite-dev tzdata zlib-dev && \
        rm -rf /var/cache/apk/* && \
        ln -s /usr/bin/convert-6 /usr/bin/convert

# Redmine Download
RUN curl -OL http://www.redmine.org/releases/redmine-${REDMINE_VERSION}.tar.gz && \
    tar xvf redmine-${REDMINE_VERSION}.tar.gz && \
    mv redmine-${REDMINE_VERSION} /var/lib/redmine && \
    rm -rf redmine-${REDMINE_VERSION}.tar.gz

# IPA font Download
RUN curl -OL http://dl.ipafont.ipa.go.jp/IPAfont/ipag${IPAFONT_VERSION}.zip && \
    unzip ipag${IPAFONT_VERSION}.zip && \
    mkdir -p /usr/share/fonts/ipa-gothic && \
    mv ipag${IPAFONT_VERSION}/ipag.ttf /usr/share/fonts/ipa-gothic/ && \
    rm -rf ipag${IPAFONT_VERSION} ipag${IPAFONT_VERSION}.zip

# Redmine Settings
WORKDIR /var/lib/redmine

RUN cp config/configuration.yml.example config/configuration.yml && \
    sed -i -e 's/  rmagick_font_path:/  rmagick_font_path: \/usr\/share\/fonts\/ipa-gothic\/ipagp.ttf/' config/configuration.yml && \
    echo "production:" > config/database.yml && \
    echo "  adapter: sqlite3" >> config/database.yml && \
    echo "  database: data/production.sqlite3" >> config/database.yml && \
    echo "  pool: 5" >> config/database.yml && \
    echo "  timeout: 5000" >> config/database.yml && \
    echo "gem \"unicorn\"" >> Gemfile.local && \
    mkdir -p data

# Redmine Install
RUN NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
    bundle install --without development test --path vendor/bundle -j${NPROC}

# Install Plug-in
WORKDIR /var/lib/redmine/plugins
RUN git clone --depth=1 https://github.com/ixti/redmine_tags.git && \
    git clone --depth=1 https://github.com/kazuhisya/redmine_default_due_date
WORKDIR /var/lib/redmine

ADD src/start.sh /var/lib/redmine/start.sh

# Volume
VOLUME ["/var/lib/redmine/data", "/var/lib/redmine/files"]

# Command
CMD ["/var/lib/redmine/start.sh"]
