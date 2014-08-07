# Docker Rails Demo

This is a demo app I created show how to develop and deploy
a moderately complex application with docker.

See the `Dockerfile` for comments on the setup.

When doing development, use `Gemfile.tip` to add gems you are playing around
with, this is a Docker build optimization.  Once you've decided you want to use
it, move it to the main `Gemfile`.

A startup script is provided in `bin/startup.rb`
This script takes various arguments to make it easy to start different services
within your app (e.g. Unicorn, Sidekiq).

### Usage

```
git clone git@github.com:cpuguy83/docker-rails-dev-demo.git
cd docker-rails-dev-demo
docker build -t rails-demo .

# Run the tests
docker run -d --name rails-app rails-demo tests
# Start the app server (unicorn) [`server` is the default command here]
docker run -d -p 80:8080 --name rails-app rails-demo
# Start the job worker (sidekiq)
docker run -d --name rails-app rails-demo jobs
```


### TODO
1. Show how to front this with nginx, including sharing assets, etc.
2. Setup logging

