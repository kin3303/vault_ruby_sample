require 'vault'

module Services
	  class VaultWrapper

	  def initialize(address, ca_cert)
		@client = Vault::Client.new(address: address)

		raise "#{ca_cert} does not exist" unless File.exist?(ca_cert)
		raise "#{ca_cert} is not readable" unless File.readable?(ca_cert)

		@client.ssl_ca_cert = ca_cert
		@client.ssl_verify = false
	  end

	  def token_auth(token)
		@client.token = token
	  end
	end
end