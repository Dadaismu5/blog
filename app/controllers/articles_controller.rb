class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
	before_action :set_article, except: [:index, :new, :create]
	def index
		#Nos busca todos los registros en la BD
		@articles = Article.all
	end
	#GET /articles/:id
	def show
		@article.update_visits_count
		@comment = Comment.new
	end
	#GET /articles/new
	def new 
		# crea nuevo registro
		@article = Article.new
	end
	#editar artuculo
	def edit

	end
	#POST /articles
		def create
			#INSERT INTO
			@article = current_user.articles.new(article_params)
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
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
	end
end
	#private - todo lo que está dentro (por debajo son metodos o acciones privadas)
	private
	def set_article
		@article = Article.find(params[:id])
	end
	def article_params	
		params.require(:article).permit(:title,:body,:cover)
	end
end