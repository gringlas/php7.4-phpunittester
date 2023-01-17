# Source for Docker image gringlas/php7.4-unittester

Use this image to power your phpunit with code-coverage - `phpunit --coverage-text` flag -  tests in gitlab-ci, as creating this container each time a unittest is run in
gitlab. It is assumed that your application installs phpunit itself into `vendor/bin/` as this image won't install a copy of phpunit.

## Building the image

To build the docker image and make it available locally, simply invoke
`docker build . -t gringlas/php7.4-unittester`

## Publishing the image

To publish the docker image, invoke
`docker push gringlas/php7.4-unittester:VERSIONTAG`

## Using the image

```
run_unittests:
    stage: test
    image: gringlas/php7.4-unittester:1.0.1
    services:
      - mysql
    
    before_script:
      # Install all project dependencies
      - composer install
      - composer unittest-gitlab-config
    
    script:
      - vendor/bin/phpunit --coverage-text
```
