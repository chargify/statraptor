## 0.1.0 (February 24, 2012)

* Added support for User, Project, and Graph resources


## 0.2.0 (February 28, 2012)

* Added support for listing users with `client.get_users`
* Added StatRaptor.disable\_ssl\_peer\_verification config option
* Implemented StatRaptor.timeout config option
* Improve how errors are raised
  * A 404 is now properly raised as a StatRaptor::Error::NotFound
  * A 401 is now properly raised as a StatRaptor::Error::Unauthorized
  * All other errors are raised as a generic StatRaptor::Error
  * Errors now include a nice parsed error message if one exists in the StatRaptor response
* All public methods now return a hash on success instead of JSON

## 0.2.1 (February 29, 2012)

* Use RestClient as the default HTTP library
  * Typhoeus bug forced this change: https://github.com/dbalatero/typhoeus/issues/96
* Set a User-Agent header for all HTTP requests

## 0.2.2 (February 29, 2012)

* Small change to depend on an earlier release of RestClient to improve gem compatibility

## 0.2.3 (March 1, 2012)

* Add suppoort for `client.find_or_create_user`

## 0.2.4 (March 6, 2012)

* Drop support for Typhoeus

## 0.2.5 (March 6, 2012)

* No, like actually drop support for Typhoeus
