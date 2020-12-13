#Para fazer a conexão do php com o mysql é necessário fazer algumas configurações no php.
#Para isso, precisamos mudar algumas coisas na imagem do docker que baixamos.
#Essas configurações são realizadas neste arquivo 'Dockerfile' e ele segue um padrão próprio
#não de yaml ou xml e sim de script.
#Em primeiro lugar usamos a tag 'FROM' para identificar a imagem que queremos mudar
#Opcionalmente eu tenho a 'LABEL' que é usada para etiquetar a imagem customizada.
#O professor gosta de usá-la para se identificar caso deseje fazer o upload da imagem
#futuramente.
#Para executar qualquer script eu utilizo a tag 'RUN' através dela eu configuro
#quais scripts desejo executar.
#Neste script estamos instalando não só o mysqli para fazer a conexao do php com o mysql
#mas também outras extensões como a do postgree 'pgsql' entre outras.
#estamos também instalando a extensão composer para o PHP na tag 'RUN' logo em seguida
#ela é usada no php, mas não conheco muito bem.
#Por último eu tenho a tag 'ENV' que é usada para setar variáveis de ambiente.
#Neste exemplo estou configurando uma variável de ambiente para o composer
#Que foi instalado no segundo 'RUN'.
#Agora que customizamos a imagem para instalar algumas extensões e setar variável de ambiente
#temos que alterar o arquivo docker-compose.yaml para utilizar a imagem customizada.


FROM php:7.4.1-apache
LABEL mantainer="oaajunior@gmail.com"

RUN buildDeps=" \
        default-libmysqlclient-dev \
        libbz2-dev \
        libmemcached-dev \
        libsasl2-dev \
    " \
    runtimeDeps=" \
        curl \
        git \
        libfreetype6-dev \
        libicu-dev \
        libjpeg-dev \
        libldap2-dev \
        libmemcachedutil2 \
        libpng-dev \
        libpq-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
    " \
    && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y $buildDeps $runtimeDeps \
    && docker-php-ext-install bcmath bz2 calendar iconv intl mbstring mysqli opcache pdo_mysql pdo_pgsql pgsql soap zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap \
    && docker-php-ext-install exif \
    && pecl install memcached redis \
    && docker-php-ext-enable memcached.so redis.so \
    && apt-get purge -y --auto-remove $buildDeps \
    && rm -r /var/lib/apt/lists/* \
    && a2enmod rewrite

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && ln -s $(composer config --global home) /root/composer

ENV PATH=$PATH:/root/composer/vendor/bin COMPOSER_ALLOW_SUPERUSER=1