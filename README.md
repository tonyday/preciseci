This vagrant setup builds a fresh Ubuntu 12.04 machine with the following installed:

* zsh
* oh-my-zsh
* vim (with Ruby/Rails supporting plugins)
* git
* postgres 9.6
* ruby 2.3.0
* heroku toolbelt
* nodejs

which can be used for development and/or CI testing of Rails projects.

Once the build is complete the machine can be packaged as a new vagrant box to speed future creation of new development machines.

Try the following:

Package the current VM (by default it creates a file called package.box)
````
vagrant package
````

Then import it into vagrant
````
vagrant box add newboxname package.box
````

Then to create a new Rails development machine you can simply do the following (in a new folder):
````
vagrant init newboxname
vagrant up
vagrant ssh
````
See [the vagrant website](https://www.vagrantup.com/) for more details.
