class CelebritiesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :setup_data
    
    #Show all celebrities
    def index
    end
    
    #Show a single celebrity
    def show
        @selected_celebrity = {}
        for celebrity in @celebrities
            if celebrity["name"] == params["name"]
                @selected_celebrity = celebrity
            end
        end
    end
    
    #Create a new celebrity
    def create
        name = params["name"]
        notability = params["notability"]
        new_celebrity = {"name" => name, "notability" => notability}
        @celebrities.push(new_celebrity)
        render json: new_celebrity
    end
    
    #Update a celebrity
    def update
        updated_celebrity = {}
        for celebrity in @celebrities
            if celebrity["name"] == params["name"]
                celebrity["notability"] = params["notability"]
                updated_celebrity = celebrity
            end
        end
        render json: updated_celebrity
    end
    
    #Remove a celebrity
    def destroy
        celebrity_to_delete = {}
        for celebrity in @celebrities
            if celebrity["name"] == params["name"]
                celebrity_to_delete = celebrity
            end
        end
        session[:celebrities] = @celebrities.select {|celebrity| celebrity["name"] != params["name"]}
        render json: celebrity_to_delete
    end

    private
    def setup_data
        session[:celebrities] = [
            { "name" => "Lindsay Lohan", "notability" => "Parent Trap" },
            { "name" => "Adam Sandler", "notability" => "Big Daddy" },
            { "name" => "Rob Schnider", "notability" => "Adam Sandler" }
        ] unless session[:celebrities]
    
        @celebrities = session[:celebrities]
    end
end