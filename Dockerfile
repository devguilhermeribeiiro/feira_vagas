# syntax = docker/dockerfile:1

# Define a versão do Ruby
ARG RUBY_VERSION=3.3.6
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

# Define o diretório de trabalho
WORKDIR /rails

# Define variáveis de ambiente para produção
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Etapa de build para reduzir o tamanho da imagem final
FROM base as build

# Instala pacotes necessários para build de gems e dependências
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential git nodejs npm libpq-dev libvips pkg-config

# Copia e instala as dependências Ruby
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# Copia e instala as dependências Node.js
COPY package.json package-lock.json ./
RUN npm install

# Copia o código da aplicação
COPY . .

# Pré-compila o código do Bootsnap
RUN bundle exec bootsnap precompile app/ lib/

# Pré-compila os assets para produção
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Gera os estilos do Tailwind CSS
RUN npm run build:css

# Etapa final para imagem de produção
FROM base

# Instala pacotes necessários para runtime
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libvips postgresql-client && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Copia os artefatos do build
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Cria e define permissões para o usuário rails
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails /rails

# Executa como usuário não root
USER rails:rails

# Define o ponto de entrada para inicialização do banco
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Exponha a porta do servidor
EXPOSE 3000

# Comando padrão para iniciar o servidor Rails
CMD ["./bin/rails", "server"]
