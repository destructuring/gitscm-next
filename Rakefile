#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

ENV['UPDATE_TOKEN'] ||= 'something'
ENV['CONTENT_SERVER'] ||= 'http://localhost:8080'
ENV['GITBOOK_DIR'] ||= '.tmp/progit/'
ENV['GENLANG'] ||= 'en'

require File.expand_path('../config/application', __FILE__)

Rake.application.options.trace = false

Gitscm::Application.load_tasks

