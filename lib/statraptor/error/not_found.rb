module StatRaptor
  # Raised when StatRaptor returns the HTTP status code 404
  class Error::NotFound < StatRaptor::Error
  end
end
