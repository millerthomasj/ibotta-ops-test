# ibotta-ops-test

# Development work
In order to develop with ibotta-ops-test some prerequisites should exist if on Mac
the following should work:

    Install Brew (/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)")
    Install VirtualBox (brew install Caskroom/cask/virtualbox)
    Install Vagrant (brew install Caskroom/cask/vagrant)
    Install Chef (brew install Caskroom/cask/chefdk)

## Get the repository
Clone Repository:

    https://github.com/millerthomasj/ibotta-ops-test.git
    cd ibota-ops-test
    bundle install
    bundle exec berks install

## Converge Centos Image with Kitchen
Run the following command to converge a development server with Kitchen:

    bundle exec kitchen converge development

## Run serverspec tests
Run all serverspec tests with the following command:

    bundle exec kitchen verify development

## Build all suites and run tests
To run serverspec tests against all versions run:

    bundle exec kitchen test

# Build ibotta-ops-test Production Server
Ideally import the ibotta-ops-test cookbook to your Chef server and go
from there. As a secondary option, change the kitchen driver plugin to
your cloud provider of choice and run the following:

    bundle exec kitchen converge production
