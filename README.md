# The Blazing Phoenix rises

We're taking the old Sinatra site and re-implementing it as a Jekyll static site.

## Installation & Requirements

* Ruby 2.7.2 with `rvm`
* Install Jekyll. https://jekyllrb.com/docs/installation/

## Build & Serve

* `jekyll serve` for local development
* Static site is available in `/public` folder
## sinatra to jekyll conversion notes

* index.md has no content and has title "home" (lowercase h) because adding a new variable called `name: home` didn't work. i don't know why. it didn't get passed into default.html's `{{ page.name }}` ... changing it to `{{ page.title }}` worked though.
* nested layouts
  * index.md uses layout `homepage.html`
  * `homepage.html` in turn uses layout `default.html`
* public directory was copied over wholesale from sinatra project
* all asset names had to be prepended with `/public`
* https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/creating-a-github-pages-site-with-jekyll
