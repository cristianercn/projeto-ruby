class RestaurantesController < ApplicationController
    
    def index
        render "index"
    end

#arquivo ERB : app/views/restaurantes/index.html.erb    
    def index # exibe todos os itens
        @restaurantes = Restaurante.all.order :id
        #Restaurante.order :id
        respond_to do |format|
           format.html
           format.xml{render xml: @restaurantes}
           format.json{render json: @restaurantes}
        end
    end

#arquivo ERB : app/views/restaurantes/show.html.erb
    def show # exibe um item específico
        @restaurante = Restaurante.find(params[:id])
    end

    def destroy # remove um item existente
        @restaurante = Restaurante.find(params[:id])
        @restaurante.destroy       
        redirect_to(action: "index")
    end

#arquivo ERB : app/views/restaurantes/new.html.erb
    def new # formulario para criação de um novo item
        @restaurante = Restaurante.new
    end
  
    def restaurante_params
        params.require(:restaurante).permit(:nome, :endereco, :especialidade)
    end
    
    def create  # cria um novo item
        @restaurante = Restaurante.new(restaurante_params)
        if @restaurante.save
            redirect_to action: "show", id: @restaurante
        else
            render action: "new"    
        end
    end

    def edit # formumlário para edição de um item
        @restaurante = Restaurante.find(params[:id])
    end

    def update # atualiza um item existente        
        @restaurante = Restaurante.find(params[:id]) 
        if @restaurante.update_attributes(restaurante_params) 
           redirect_to action: "show", id: @restaurante
        else
            render action: "edit"
        end
    end

end
