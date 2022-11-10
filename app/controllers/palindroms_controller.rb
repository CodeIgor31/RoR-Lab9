# frozen_string_literal: true

# Palindroms controller
class PalindromsController < ApplicationController
  def index; end

  def result
    @number = params[:num].to_i
    @res_arr = PalindromsController.result_array(@number)
    respond_to do |format|
      format.html
      format.json do
        render json:
        { type: @res_arr.class.to_s, value: [@number, @res_arr] }
      end
    end
  end

  def self.result_array(num)
    arr = (0..num).select do |elem|
      elem.to_s == elem.to_s.reverse && (elem**2).to_s == (elem**2).to_s.reverse
    end
    Array(arr)
  end
end
