Sigimera Client
===============

This repository includes a ruby client library for the REST API under http://api.sigimera.org.


Installation
------------

Install _sigimera_ manually from command line:

```sh
gem install sigimera
```

Add _sigimera_ to your Gemfile:

```ruby
gem 'sigimera'
```


Usage
-----

This examples are only a short outline how to use the library. For more
information read the documentation, checkout the rspecs or look into the
source code. To use the library include or execute the following lines:

```sh
irb
>> require "sigimera"
>> puts Sigimera::Client.get_api_version
>> puts Sigimera::Client.get_public_crises
>> puts Sigimera::Client.get_public_rss_feed

# see http://api.sigimera.org/dashboard
>> client = Sigimera::Client.new("YourSecretToken")
>> puts client.get_latest_crises
>> puts client.get_latest_crises(type = "earthquakes")
```


Start RSpec Tests
-----------------

In order to test this library with the help of rspec you have get first an
_authentication token_ under the [Developer Dashboard](http://api.sigimera.org/dashboard)

```sh
export AUTH_TOKEN=YourSecretToken
rake spec
```

API Documentation
-----------------

This library simplifies the Sigimera REST API. If you want learn more about
this API you can use the following links:

* [Quickstart](http://api.sigimera.org/quickstart)
* [FAQ](http://api.sigimera.org/faq)
* [Developer Dashboard](http://api.sigimera.org/dashboard): You must be logged
  in.


License
-------

(c) 2012 by [Sigimera](http://www.sigimera.org),
published under MIT license.


Warranty
--------

This software is provided "as is" and without any express or implied
warranties, including, without limitation, the implied warranties of
merchantibility and fitness for a particular purpose.

