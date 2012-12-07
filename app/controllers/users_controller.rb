class UsersController < ApplicationController

    def index
       @users = User.all

        respond_to do |format|
          format.html
          format.json { render :json => @users }
        end

     end


      #lets us add more users
      def create

        @user = User.new

        #Need the [:teams] because its a hash based on the post, and then
        #within that hash, we access the [:name]
        @user.name = params[:user][:name]
        @user.email = params[:user][:email]

        @user.save!

        respond_to do |format|
          format.html { redirect_to users_url }
          format.json { render :json => @user }
        end

      end

     #update our teams us add more teams
      def update
        @user = User.find(params[:id])
        @user.name= params[:user][:name]
        @user.email = params[:user][:email]
        
        respond_to do |format|
          format.html { redirect_to users_url }
          format.json { render :json => @user }
        end

      end

     #gives us information about one of the teams
     def show

      @user = User.find(params[:id])

        respond_to do |format|
          format.html
          format.json { render :json => @user}
        end

     end
      
     #Destroys a team
     def destroy
      @user = User.find(params[:id])
      @user.delete

      respond_to do |format|
          format.html { redirect_to users_url }
          format.json { head :ok }
       end

     end

     #Returns all of the good students in a JSON hash
     # def fivehundred_teams
      #  @teams = Team.fivehundred_teams

       # respond_to do |format|
        #  format.json { render :json => @teams }
        #end
      
      #end



end
