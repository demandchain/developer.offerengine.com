module OfferEngine
  def self.error_response
    {
      :status => "error",
      :error_type => "",
      :error_msg => "",
    }
  end
end
