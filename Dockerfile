## jdate
FROM alpine:3.15
ARG source="nongnu"
ARG pkgs="automake libtool make autoconf file g++ git tzdata"
ARG os_version="\$(grep '^PRETTY' /etc/os-release | sed 's/.\+=\"\(.\+\)\"/\1/')"
ARG jdate_version="\$(jdate --version | xargs)"
ARG info="echo -e \"${os_version}\\n${jdate_version}\\n\$(jdate)\""
ARG prompt="PS1=\"\[\e[0;49;32m\]\u\[\e[0m\]\[\e[0;49;90m\]@\[\e[0m\]\[\e[0;49;34m\]\w\[\e[0m\] \""
ARG script=/tmp/install-jdate
ARG username="jdate"
ARG bashrc_file=/home/"$username"/.bashrc
ADD https://raw.githubusercontent.com/davoudarsalani/scripts/master/install-jdate "$script"
RUN set -x && \
    apk add --no-cache bash $pkgs && \
    \
    sed -i '/ldconfig/d' "$script" && \
    sed -i '/INSTALLING-DEPENDENCIES::START/,/INSTALLING-DEPENDENCIES::END/d' "$script" && \
    chmod +x "$script" && \
    "$script" "$source" && \
    \
    adduser --uid 10001 --shell /bin/bash --disabled-password "$username" && \
    \
    printf '%s\n' "$info" >> "$bashrc_file" && \
    printf '%s\n' "$prompt" >> "$bashrc_file" && \
    chown "$username" "$bashrc_file" && \
    \
    cp /usr/share/zoneinfo/Asia/Tehran /etc/localtime && \
    printf 'Asia/Tehran\n' > /etc/timezone && \
    \
    apk del $pkgs && \
    rm -rfv "$script" /tmp/tmp* && \
    unset source pkgs os_version jdate_version info prompt script bashrc_file && \
    set +x
USER "$username"
WORKDIR /home/"$username"
CMD bash



## khayyam/persiantools/jdatetime
FROM python:3.10-alpine3.15

## for khayyam:
# ARG module="khayyam"
# ARG module_version="khayyam \$(python -c \"import khayyam; print(khayyam.__version__)\")"
# ARG khayyam_pkgs="cmake gcc libxml2 automake g++ subversion python3-dev libxml2-dev libxslt-dev lapack-dev gfortran"
# ARG current="\$(python -c \"import khayyam; print(khayyam.JalaliDatetime.now())\")"

## for persiantools:
# ARG module="persiantools"
# ARG module_version="persiantools \$(python -c \"import persiantools; print(persiantools.__version__)\")"
# ARG extra_modules="pytz"
# ARG current="\$(python -c \"from persiantools.jdatetime import JalaliDateTime; print(JalaliDateTime.now())\")"

ARG module="jdatetime"
ARG module_version="jdatetime \$(python -c \"import jdatetime; print(jdatetime.__VERSION__)\")"
ARG current="\$(python -c \"import jdatetime; print(jdatetime.datetime.now())\")"

ARG os_version="\$(grep '^PRETTY' /etc/os-release | sed 's/.\+=\"\(.\+\)\"/\1/')"
ARG python_version="\$(python --version)"
ARG info="echo -e \"${os_version}\\n${python_version}\\n${module_version}\\n${current}\""
ARG prompt="PS1=\"\[\e[0;49;32m\]\u\[\e[0m\]\[\e[0;49;90m\]@\[\e[0m\]\[\e[0;49;34m\]\w\[\e[0m\] \""
ARG username="$module"
ARG bashrc_file=/home/"$username"/.bashrc
ARG startup_file=/home/"$username"/python-startup.py
RUN set -x && \
    apk add --no-cache bash $khayyam_pkgs && \
    \
    adduser --uid 10001 --shell /bin/bash --disabled-password "$username" && \
    \
    printf 'import %s\n' "$module" >> "$startup_file" && \
    printf "print(\"+++\\\n+++ '%s' imported\\\n+++\")\n" "$module" >> "$startup_file" && \
    chown "$username" "$startup_file" && \
    chmod +x "$startup_file" && \
    \
    printf '%s\n' "$info" >> "$bashrc_file" && \
    printf '%s\n' "$prompt" >> "$bashrc_file" && \
    printf 'export PYTHONSTARTUP=%s\n' "$startup_file" >> "$bashrc_file" && \
    chown "$username" "$bashrc_file" && \
    \
    cp /usr/share/zoneinfo/Asia/Tehran /etc/localtime && \
    printf 'Asia/Tehran\n' > /etc/timezone && \
    \
    pip install --upgrade --no-cache-dir --disable-pip-version-check pip "$module" $extra_modules
    \
    apk del tzdata $khayyam_pkgs && \
    unset module module_version khayyam_pkgs current extra_modules os_version python_version info prompt bashrc_file startup_file && \
    set +x
USER "$username"
WORKDIR /home/"$username"
CMD bash
