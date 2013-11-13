# Sprockets Sinatra Boilerplate

A boilerplate front-end app using Sprockets, Sinatra, CoffeeScript, Eco, Slim, and Bower.  Develop front-end apps in coffeescript, less, sass, scss, and eco without having to compile your assets.  Manage your web dependencies with Bower.

* [Sprockets](//github.com/sstephenson/sprockets) - Asset Pipeline
* [Sinatra](//github.com/sinatra/sinatra) - Serves HTML
* [CoffeeScript](//github.com/jashkenas/coffee-script) - Nicer than JavaScript
* [Eco](//github.com/sstephenson/eco) - Embedded CoffeeScript templates
* [Slim](//github.com/slim-template/slim) - Nicer than HTML
* [Bower](//github.com/bower/bower) - Package manager for web assets
    * [json3](//github.com/bestiejs/json3) - JSON polyfill
    * [jQuery](//github.com/jquery/jquery) - JavaScript utilities
    * [underscore](//github.com/jashkenas/underscore) - More JavaScript utilities
    * [backbone](//github.com/jashkenas/backbone) - Model/View/Collection framework
    * [bootstrap](//github.com/twbs/bootstrap) - Common UI elements
    * [font-awesome](//github.com/FortAwesome/font-awesome) - More icon fonts
    * [select2](//github.com/ivaynberg/select2) - Enhanced select boxes
    * [qunit](//github.com/jquery/qunit) - JavaScript unit testing

# Running the server

1. Install Ruby components.  The project uses [Bundler](http://bundler.io) to manage gem dependencies.  You may need to install Ruby and the bundler gem.  Ruby dependencies are tracked in the `Gemfile`.

        bundle install

2. Install web components.  The project uses [bower](http://bower.io) to manage web dependencies.  You may need to install [Node](http://nodejs.org) and bower.  Web dependencies are tracked in the `bower.json` file.

        bower install

3. Start the server.

        rackup

4. Open the app in a browser at `http://localhost:9292`.

## Production Environments

1. Precompile your assets (concatenate and minify/uglify).  Note that the `RACK_ENV` environment variable must be set to production when precompiling assets.

        RACK_ENV=production rake assets:clean assets:precompile

2. Start server in production mode.

        rackup -E production

The `javascript_tag` helper in your HTML templates will compute the file's fingerprint and serve the compressed/uglified file.

## Development Environments

Sprockets will not concatenate `require`d files in development environments and instead serve individual javascript files.  This will aid debugging, setting breakpoints, and following stacktraces.

The `javascript_tag` helper in your HTML templates will create individual `<script>` tags for each `require`d file.

# Create your own project

1. Clone it.

        git clone https://github.com/lepfhty/sprockets-sinatra-boilerplate.git

2. Delete the .git folder.

        cd sprockets-sinatra-boilerplate
        rm -rf .git

3. Follow these instructions: [Create a repo](https://help.github.com/articles/create-a-repo)

## Adding new web dependencies

1. `bower install <package> -S`
2. Add the necessary Sprockets directives at the top of assets/javascripts/app.js.coffee.  See section below on bower components.


# How it works

A rackup configuration file starts Sprockets and Sinatra on the same host and port.  This project is useful when most of your development is done on a javascript front-end.  You can develop in coffeescript, less, sass, scss, and eco without having to compile your assets.  Once in awhile, you may add a new route or a new page to the Sinatra back-end application, but this project was not meant to simplify or streamline back-end development.

## Rackup

The rackup file `config.ru` runs the Sinatra application module defined in `app.rb`.  Sprockets integration is provided by the awesome [sinatra-asset-pipeline](//github.com/kalasjocke/sinatra-asset-pipeline) gem.

## Sprockets

### `/vendor/assets/bower_components`

Web components installed by bower are kept here.

#### Bower-Aware
Some components installed by bower declare their distribution files in the `bower.json` or `component.json` file under the `main` attribute.  Twitter Bootstrap and jQuery follow this convention.  In these cases, Sprockets is "bower-aware" and it is sufficient to use `require <component-name>` to include the relevant javascript/css files.

#### Other
Other components do not follow this convention.  FontAwesome, Backbone and Underscore are examples of this.  In these cases, you must use the full logical path to each asset needed (like any other asset, no special handling).

### `/assets/javascripts`

Javascript files are kept here.

Maintain your own directory structure (models, collections, controllers, etc...) to organize javascript files.  [CoffeeScript](//github.com/jashkenas/coffee-script) files with extension `.js.coffee` can also be kept here and are dynamically compiled by Sprockets so you don't have to.  An [example coffeescript file](https://github.com/lepfhty/sprockets-sinatra-boilerplate/blob/master/javascripts/example.js.coffee) is provided.


### `/assets/javascripts/templates`

Javascript templates are kept here.

Maintain your own directory structure to organize template files.  [Embedded CoffeeScript](//github.com/sstephenson/eco) files with extension `.jst.eco` can also be kept here.  An [example eco file](https://github.com/lepfhty/sprockets-sinatra-boilerplate/blob/master/javascripts/templates/example.jst.eco) is provided.

### `/assets/stylesheets`

Stylesheets are kept here.

Sprockets supports:

  * SASS - add `sass` gem to `Gemfile`, files with extensions `.css.sass`
  * SCSS - add `sass` gem to `Gemfile`, files with extensions `.css.scss`
  * LESS - add `less` gem to `Gemfile`, files with extensions `.css.less`

## Sinatra

### `/app.rb`

This file defines the Sinatra application.  It currently renders a single `index.slim` file at the `/` root URL, using the [Slim](//github.com/slim-template/slim) templating engine.  You can define other routes here as necessary.

This project uses the [sinatra-asset-pipeline](//github.com/kalasjocke/sinatra-asset-pipeline) gem to achieve integration between Sinatra and Sprockets in both development and production environments.

### `/views`

Sinatra templates are kept here.  Now it contains just the `index.slim` Slim template, but you can put others here.

### `/public`

Static files are served by Sinatra from this directory.  You may put images or other static assets here as well.
