This vagrant setup builds a fresh Ubuntu 14.04 development machine with the following installed:
- git
- postgres
- ruby 2.2.2
- heroku toolbelt
- nodejs

which I find quite useful for Rails development.

Once the build is complete the machine can be packaged as a new vagrant box to speed future creation of new development machines.

Try the following:

Package the current VM (be default it creates a file called package.box)
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
