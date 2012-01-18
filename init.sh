#!/bin/bash

#open sporks guard and server
gnome-terminal --tab --command  "bash -c 'bundle exec spork cucumber;bash -i'" --tab --command  "bash -c 'bundle exec spork rspec;bash -i'" --tab --command  "bash -c 'bundle exec guard;bash -i'" --tab --command  "bash -c 'rails s;bash -i'"

#open tails on the dev log and test log
gnome-terminal --tab --command  "bash -c 'tail -f log/development.log'" --tab --command  "bash -c 'tail -f log/test.log'"

#open firefox

gnome-terminal --tab --command "bash -c 'firefox localhost:3000'"

#open gedit
gmate
