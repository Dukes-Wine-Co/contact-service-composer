SHELL := /bin/bash
.DEFAULT_GOAL := help

help:
	@echo "Help command needs to be written";

build:
	@docker build -t dukes-wine/contact-service-composer .

run:
	@sh scripts/docker-commands.sh runContainer contact-service-composer

stop:
	@docker stop contact-service-composer
