require 'koala'
require 'openssl'

if __FILE__ == $0
  oauth_access_token = "CAAHYOXQ7qk4BABa9pkieZBmmMAxwmwnbN7rylpoDmMb3hzS1iv6i4w2DXZCMstFC5NZCVk7AoZBAlQ3g6Lmrqbm29TJF3zbpZAFmEtkHWppXaoazLfKGzr4BAUSGtL68EZCXctdN9OaTZB9udukEr9QP8RzZCpdwgKBO2oRKsAQRcU4tFEU1itE6IWYQdr0n6FvlGsJHjW4ol3ci5bMsnzOd"
  @graph = Koala::Facebook::API.new(oauth_access_token)
  user = @graph.get_object("me", {}, api_version: "v2.0")
  puts user
end