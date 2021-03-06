# encoding: utf-8
class Admin::DrugsController < ApplicationController

  include ApplicationHelper
  before_filter :require_admin

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    drug = Drug.new({
      :name => params[:name],
      :content => params[:content],
      :price => params[:price],
    })
    drug.save
    flash[:success] = "İlaç eklendi"
    redirect_to "/admin/drugs/#{drug.id}"
  end

  def update
    drug = Drug.update(params[:id], {
      :name => params[:name],
      :content => params[:content],
      :price => params[:price],
    })

    if drug.save
      flash[:success] = "İlaç Güncellenmiştir."
    else
      flash[:error] = "İlaç Güncellenemedi."
    end
    redirect_to "/admin/drugs/#{drug.id}"
  end

  def destroy
    if Drug.delete(params[:drug_id])
      flash[:success] = "Kayıt Silindi"
    else
      flash[:error] = "Kayıt Silinemedi"
    end
    redirect_to '/admin/drugs'
  end
end
