# Docker ElastAlert
To run the docker container for [Yelp's ElastAlert](https://github.com/Yelp/elastalert).

## Building the image
During the building time, the `config.yaml` and the rules(*.yaml) defined in the `rules` folder will be added to the image. So if you have changed the configuration or the rules, make sure to `docker build ...` before running the container.

For example:

```bash
$ docker build -t some-repository/docker-elastalert .
```

## Running the container
You can assign the environment variables to the ElastAlert configuration, such as `ELASTICSEARCH_HOST` and `ELASTICSEARCH_PORT`.

For example:

```bash
$ docker run -e "ELASTICSEARCH_HOST=some.elasticsearch.host.com" -e "ELASTICSEARCH_PORT=9200" some-repository/docker-elastalert
```

## Configuration
The general settings for ElastAlert to run each rule. The `config.yaml` file will be added to the container during the building step. Note that some configuration values will be replaced by environment variables, such as `ELASTICSEARCH_HOST` and `ELASTICSEARCH_PORT`.

Go ahead to check/modify the contents of `config.yaml` before you run the container. Do not change the filename/path.

## Rules
The rules(*.yaml) defined in the `rules` folder will be added to the ElastAlert container, so if you want to change/add your rules, a new version of the image must be built.

Go ahead to check/modify the rules(*.yaml) in the `rules` folder before you run the container. Note that the container will apply all rules in the `rules` folder that ends with `.yaml`.

## Alert
Configure the alert method by each rule(*.yaml) in the `rules` folder. For example, if the alerting is using 'slack', the 'slack_webhook_url' must be provided. You may also need to mount files into the container, like smtp configuration values for Email alerting.

For more details, please read [docs](http://elastalert.readthedocs.io/en/latest/ruletypes.html#alerts).
