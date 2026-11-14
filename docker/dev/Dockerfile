# syntax=docker/dockerfile:1
#
# Contêiner de desenvolvimento da Loja Ágil na Nuvem.
# Uma imagem com as três linguagens do curso em versões fixas: o aluno não instala toolchain.
# Versões validadas em 2026-11-14 para o curso.

FROM node:26.13.1-trixie-slim AS node
FROM eclipse-temurin:25.0.5_8-jdk AS jdk
FROM maven:3.9.16-eclipse-temurin-25 AS maven
FROM ghcr.io/astral-sh/uv:0.13.8 AS uv

FROM python:3.14.10-slim-trixie

ARG AWS_CLI_VERSION=2.40.3
ARG TARGETARCH
ARG UID=1000
ARG GID=1000

# procps: o StrykerJS, usado nos testes de mutação, chama `ps` para encerrar os processos de teste
RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl git unzip less procps \
 && rm -rf /var/lib/apt/lists/*

# Node 24 (com npm e corepack) copiado da imagem oficial
COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
RUN ln -s ../lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
 && ln -s ../lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx \
 && ln -s ../lib/node_modules/corepack/dist/corepack.js /usr/local/bin/corepack

# JDK 25 e Maven 3.9
COPY --from=jdk /opt/java/openjdk /opt/java/openjdk
COPY --from=maven /usr/share/maven /usr/share/maven
# Links em /usr/local/bin: o PATH do ENV some num shell de login (bash -l relê /etc/profile)
RUN ln -s /usr/share/maven/bin/mvn /usr/local/bin/mvn \
 && for b in java javac jar jshell; do ln -s /opt/java/openjdk/bin/$b /usr/local/bin/$b; done
ENV JAVA_HOME=/opt/java/openjdk

# uv (gerenciador de projetos Python)
COPY --from=uv /uv /uvx /usr/local/bin/

# AWS CLI v2, versão fixa
RUN case "$TARGETARCH" in arm64) arch=aarch64 ;; *) arch=x86_64 ;; esac \
 && curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-${arch}-${AWS_CLI_VERSION}.zip" -o /tmp/awscli.zip \
 && unzip -q /tmp/awscli.zip -d /tmp \
 && /tmp/aws/install \
 && rm -rf /tmp/aws /tmp/awscli.zip

# Usuário sem root, com o mesmo UID do host para os arquivos do volume não virarem do root
RUN groupadd --gid "$GID" dev \
 && useradd --uid "$UID" --gid "$GID" --create-home --shell /bin/bash dev
USER dev
# Pastas dos volumes de cache criadas pelo usuário dev: o volume nomeado herda o dono
RUN mkdir -p /home/dev/.cache/uv /home/dev/.npm /home/dev/.m2 /home/dev/.aws
ENV UV_LINK_MODE=copy \
    UV_PYTHON_DOWNLOADS=never \
    NPM_CONFIG_UPDATE_NOTIFIER=false
WORKDIR /workspace

CMD ["sleep", "infinity"]
