# Ruby MRI development with Docker and Dip

The repo contains Docker and [Dip][] configuration for developing Ruby MRI.

## Usage

- Clone Ruby to next to this project's folder:

```sh
git clone https://github.com/ruby/ruby.git ../ruby
```

If you want to keep Ruby source code in the different location, create a `dip.override.yml` file with following contents:

```yml
# dip.override.yml
environment:
  RUBY_SRC_PATH: "relative/path/to/ruby"
```

- Install [Dip][]

- Provision the dev container and volumes:

```sh
dip provision
```

- Run make tasks with Dip:

```sh
dip make

# for example, to run pattern matching tests
dip make test-all TESTS='test/ruby/test_pattern_matching.rb'
```

- Login into the container:

```sh
dip bash
```

- (Optionally for VS Code users) Run container in the background and connect to it via [Remote Containers](https://code.visualstudio.com/docs/remote/attach-container) feature:

```sh
dip up -d dev

# go to Remote-Container: Attach to Running Container...
# and chooose ruby_dev_1
```

## Acknowledgments

Inspired by [@kirs][] post ["Contributing to Ruby MRI"](https://kirshatrov.com/2020/01/11/contributing-to-mri/).
The main difference is that the setup from this repo is IDE-agnostic (and at the same time plays well with VS Code Remote Containers).

## Resources

- [Contributing to Ruby MRI](https://kirshatrov.com/2020/01/11/contributing-to-mri/)
- [Ruby Hack challenge repo](https://github.com/ko1/rubyhackchallenge/tree/master/EN)
- [VM stacks "puts-debugging" gist](https://gist.github.com/palkan/dcab4ed0978dfe6f55f9b6533d3e80a9)

[Dip]: https://github.com/bibendi/dip
[@kirs]: https://github.com/kirs
