version-laravel-env
======

Adcionar versões de tags do git no .env do Laravel.

Instalação
------------

1.  Você deve salvar o arquivo version.sh no diretorio raiz do seu projeto
2.  Em seu arquivo .env será preciso adcionar as duas variáveis, ```APP_VERSION``` e ```APP_HASH```.


Deploy
-----

Este processo ultiliza internamente os serguintes comandos, do git ```git fetch && git checkout -f $NEW_VERSION``` onde a variável ```$NEW_VERSION``` será a versão do deploy, supondo que sua aplicação esteja na versão 0.1.1 e você irá atualizar para a versão 0.1.2 executado o comando como exemplo abaixo:

``` ./version.sh 0.1.2 ```

A Seguinte mensagem aparecerá

```Versao atual = 0.1.1 Efetuando deploy para versão: 0.1.2 (582fee5)```

### Utilizando no Laravel 

Após a autaliazação para ultilizar é bem simples.

``` env('APP_VERSION')```

-
