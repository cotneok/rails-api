class Api::V1::BooksController < ApplicationController
  before_action :load_book, only: :show
  def index
    @books = Book.all
    json_response "Index Books Successfully", true, {books: @books}, :ok
  end

  def show
    json_response "Show Book Successfully", true, {book: @book}, :ok
  end

  private
  def load_book
    @book = Book.find_by(id: params[:id])
    unless @book.present?
      json_response "Can not get Book", false, {}, :not_found
    end
  end
end
