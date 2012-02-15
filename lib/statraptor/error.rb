module StatRaptor
  # Custom error class for rescuing from all StatRaptor errors
  class Error < StandardError

    # Initializes a new Error object
    #
    # @param message [String]
    # @return [StatRaptor::Error]
    def initialize(message)
      super(message)
    end
  end
end
