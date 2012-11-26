Sigimera Client
===============

The following ruby gem encapsulates access to the Sigimera REST API under
http://api.sigimera.org. It includes the needed SSL certificate for the
HTTPS connections and a detailed documentation. This library will be
developed in parallel to the API.


Installation
------------

Add this line to your application's Gemfile:

```ruby
gem 'sigimera'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install test
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
>> puts Sigimera::Client.get_auth_token("johndoe@example.org", "verySecretPassword")

# see http://api.sigimera.org/dashboard
>> client = Sigimera::Client.new("YourSecretToken")
or
# The username and password are NOT stored, but only used to fetch an
# authentication token
>> client = Sigimera::Client.new(username = "johndoe@example.org", password = "verySecretPassword")
>> puts client.get_latest_crises
>> puts client.get_latest_crises(type = "earthquakes")
>> puts client.get_crises_stat
>> puts client.get_user_stat
```


Start RSpec Tests
-----------------

In order to test this library with the help of rspec you have get first an
_authentication token_ under the [Developer Dashboard](http://api.sigimera.org/dashboard)

```sh
export AUTH_TOKEN=YourSecretToken
rake spec
```

The following continuous integration tests includes only the public accessible endpoints.

[![Build
Status](https://secure.travis-ci.org/Sigimera/sigimera-ruby-client.png?branch=master)](https://travis-ci.org/Sigimera/sigimera-ruby-client)

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

