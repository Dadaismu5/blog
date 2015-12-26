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
	#editar artuculo
	def edit
		@article = Article.find(params[:id])
	end
	#POST /articles
		def create
			@article = Article.new(article_params)
			if @article.save
				redirect_to @article
		else
			render :new
		end	
	end
	#este metodo elimina los post
		def destroy
			@article= Article.find(params[:id])
			@article.destroy #Destroy elimina el objeto de la base de datos
			redirect_to articles_path
	end
	#PUT /articles/:id
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
	end
end
	#private - todo lo que está dentro (por debajo son metodos o acciones privadas)
	private
	def article_params	
		params.require(:article).permit(:title,:body)
	end
end