# Rails application on docker sample

This is an example of Rails application on Docker with Vagrant.

## Required

- Vagrant
- VirtualBox

## Setup (MacOSX)

Enable nfsd:

```bash
$ sudo nfsd enable
```

Add nfsd exports file:

```bash
$ sudo touch /etc/exports
```

## Usage

### Basic usage

```bash
# clone
$ git clone https://github.com/kouhei-fuji/rails_docker_sample.git

# vagrant up
$ cd rails_docker_sample && vagrant up && vagrant reload

# access
$ open http://192.168.10.2:3000
```

### Run with webrick (Default)

```bash
# ssh
$ vagrant ssh

# docker run
$ cd /rails_docker_sample
$ docker-compose up -d

# access
$ exit
$ open http://192.168.10.2:3000
```

### Run with nginx and unicorn

```bash
# ssh
$ vagrant ssh

# docker run
$ docker-compose -f docker-compose-nginx.yml up -d

# access
$ exit
$ open http://192.168.10.2
```

## License

This repository is under the [MIT License](https://opensource.org/licenses/MIT).
