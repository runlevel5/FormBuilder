Form Builder
------------

The application takes in a PDF, split PDF pages to many PNGs then you could overlay
template box on images which later can be converted to PDF form with data filled in.

Installation
------------

The application uses RGhost which in turn utilise ghostscript. Make sure you
install binary of ghostscript.

On OSX:
    $ brew install ghostscript

On Windows, please download from http://www.ghostscript.com/

Additionally, ImageMagick is required for paperclip gem.

On OSX:
    $ brew install imagemagick

On Windows, please download from http://www.imagemagick.org/

All gems can be installed with bundler:

    $ bundle install

Bootstrapping
-------------

    $ bundle exec rake db:migrate
    $ bundle exec rake db:seed

Configuration
-------------

If you place ghostscript binary in non-default path, please make sure you
set `RGhost::Config::GS[:path]` in initializers/rghost.rb

Running the application
-----------------------

Start the server:
    $ rails server

