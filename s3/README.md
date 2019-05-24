# S3

**TODO: Add description**

* ExAws.Config.new(:s3)
* ec2-18-188-151-54.us-east-2.compute.amazonaws.com
* 18.188.151.54
* ssh -i meetup.pem ubuntu@ec2-18-188-151-54.us-east-2.compute.amazonaws.com
* scp -i "meetup.pem" meetup-client.tar.Z ubuntu@ec2-18-188-151-54.us-east-2.compute.amazonaws.com:meetup-client.tar.Z
* sudo netstat -plnt
* sudo apt-get install nginx
* systemctl status nginx
* sudo systemctl restart nginx
* sudo systemctl stop nginx
* /home/ubuntu/meetup-client
* localStorage.setItem('key', 'value')
* http://ec2-18-188-151-54.us-east-2.compute.amazonaws.com:4200/

* curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
* ## Run `sudo apt-get install -y nodejs` to install Node.js 10.x and npm
## You may also need development tools to build native addons:
     sudo apt-get install gcc g++ make
## To install the Yarn package manager, run:
     curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
     echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
     sudo apt-get update && sudo apt-get install yarn
* sudo apt-get install -y build-essential

* ng build --prod
* ng serve --host 0.0.0.0 --public-host ec2-18-188-151-54.us-east-2.compute.amazonaws.com
 
## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `s3` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:s3, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/azure](https://hexdocs.pm/azure).

