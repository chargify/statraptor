module StatRaptor
  # Raised when StatRaptor returns the HTTP status code 401
  class Error::Unauthorized < StatRaptor::Error
  end
end
