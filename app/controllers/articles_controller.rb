class ArticlesController < ApplicationController
	def index
		#Nos busca todos los registros en la BD
		@articles = Article.all
	end
	#GET /articles/:id
	def show
		#Busca los registros por ID
		@article = Article.find(params[:id])
		#Where
	end
	#GET /articles/new
	def new 
		# crea nuevo registro
		@article = Article.new
	end
	#POST /articles
		def create
			@article = Article.new(title: params[:article][:title], body: params[:article] [:body])
			if @article.save
				redirect_to @article
		else
			render :new
		end	
	end
		def destroy
			@article= Article.find(params[:id])
			@article.destroy #Destroy elimina el objeto de la base de datos
			redirect_to articles_path
	end
	#PUT /articles/:id
	def update
		# @article.update_atributes({title: 'nuevo titulo'})
	end
end