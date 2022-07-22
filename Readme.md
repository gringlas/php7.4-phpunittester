# Source for Docker image gringlas/php7.4-unittester

Use this image to power your phpunit tests in gitlab-ci, as creating this container each time a unittest is run in
gitlab is a waste of resource and time.

## Building the image

To build the docker image and make it available locally, simply invoke
`docker build . -t gringlas/php7.4-unittester`

## Publishing the image

To publish the docker image, invoke
`docker push gringlas/php7.5-unittester:VERSIONTAG`

## Using the image

Use it like this in a gitlab-ci.yml, like for example used in https://vc.nettrek.biz/tvengels/lcms/:

```
run_unittests:
    stage: test
    #  image: php:7.4-cli
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
