class TwintsController < ApplicationController
    def index
        @twints = Twint.all
    end
    
    def new
        @twint = Twint.new
    end
    
    def create
        @twint=Twint.new(twints_params)
        if params[:back]
            render :new
        elsif @twint.save 
            redirect_to twints_path, success: "ツゥいーとしました！"
        else
            render :new
        end
    end
    
    def confirm
        @twint = Twint.new(twints_params)
        if @twint.invalid?
            @twint.errors.full_messages.each do |msg|
                #これたぶんためだ・・・
                #複数エラーがあったときの挙動・・・
                redirect_to twints_path, danger: msg
                return
            end
        end
    end
    
    def edit
        @twint = Twint.find(params[:id])
    end
    
    def update
        @twint = Twint.find(params[:id])
        @twint2 = Twint.new(twints_params)
        if @twint2.invalid?
            @twint2.errors.full_messages.each do |msg|
                #これたぶんためだ・・・
                #複数エラーがあったときの挙動・・・
                redirect_to twints_path, danger: msg
                return
            end
        else 
            @twint.update(twints_params)
            redirect_to twints_path, success: "ツゥいーとを編集しました！"
        end
    end
    
    def destroy
        @twint = Twint.find(params[:id])
        @twint.destroy
        redirect_to twints_path, success: "ツゥいーとを削除しました..."
    end
    
    private
    def twints_params
      params.require(:twint).permit(:content)
    end
end
