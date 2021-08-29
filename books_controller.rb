class BooksController < ApplicationController
    def index
      if params[:search] == nil
        @books= Book.all.page(params[:page]).per(3)
    elsif params[:search] == ''
        @books= Book.all.page(params[:page]).per(3)
    else
        #部分検索
        @books = Book.where("about LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(3)
    end
    end

    def new
     @book = Book.new
    end

    def create
        book = Book.new(book_params)
        book.user_id = current_user.id
        if book.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @book = Book.find(params[:id])
      end

      def edit
        @book = Book.find(params[:id])
      end

      def update
        book = Book.find(params[:id])
        if book.update(book_params)
          redirect_to :action => "show", :id => book.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to action: :index
      end

      before_action :authenticate_user!

      private
      def book_params
        params.require(:book).permit(:about, :image)
      end
    

end
