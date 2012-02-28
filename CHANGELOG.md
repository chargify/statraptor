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
