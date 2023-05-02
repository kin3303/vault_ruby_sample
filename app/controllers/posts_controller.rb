


class PostsController < ApplicationController
  def index
	  @posts = Post.all
  end

  def new
  end

  def create
	  Post.create(title: params[:title], content: params[:content])
	  redirect_to "/posts/index"
  end

  def show
	  @post = Post.find(params[:id])
  end
	
  def edit
	  @post = Post.find(params[:id])
  end
	
  def update 
	 #require './lib/my_service'
	  
	  @post = Post.find(params[:id])  
	  
	  ca_cert = File.open("/workspace/certificate.crt")
	  vault = Services::VaultWrapper.new("https://vault.idtplateer.com", ca_cert)
	  vault.token_auth("hvs.BzgsMs2VqA0RBn8feu1zdDgL")

	  #key_name = "my-transit-key"
	  #key_type = "rsa-2048"
	  #vault.create_transit_key(key_name, key_type)
 
	  #vault = Vault::Client.new(address: "https://vault.idtplateer.com", token: "hvs.BzgsMs2VqA0RBn8feu1zdDgL", ssl_verify: false)
	  #vstatus = vault.sys.seal_status
	  #wrapped = vault.auth_token.create(wrap_ttl: "100s")
	  #unwrapped = vault.logical.unwrap(wrapped.wrap_info.token)
	  #token = unwrapped.data.auth.client_token
 
	  @post.update(title: params[:title], content: "aa") 
	  redirect_to "/posts/show/#{@post.id}" 
  end
	
  def destroy
	  Post.destroy(params[:id])
	  redirect_to "/posts/index"
  end
end