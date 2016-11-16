class PurposeStatementsController < ApplicationController
  before_action :current_user_must_be_purpose_statement_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_purpose_statement_user
    purpose_statement = PurposeStatement.find(params[:id])

    unless current_user == purpose_statement.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = PurposeStatement.ransack(params[:q])
    @purpose_statements = @q.result(:distinct => true).includes(:user, :sr_purpose_statements).page(params[:page]).per(10)

    render("purpose_statements/index.html.erb")
  end

  def show
    @sr_purpose_statement = SrPurposeStatement.new
    @purpose_statement = PurposeStatement.find(params[:id])

    render("purpose_statements/show.html.erb")
  end

  def new
    @purpose_statement = PurposeStatement.new

    render("purpose_statements/new.html.erb")
  end

  def create
    @purpose_statement = PurposeStatement.new

    @purpose_statement.user_id = params[:user_id]

    save_status = @purpose_statement.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/purpose_statements/new", "/create_purpose_statement"
        redirect_to("/purpose_statements")
      else
        redirect_back(:fallback_location => "/", :notice => "Purpose statement created successfully.")
      end
    else
      render("purpose_statements/new.html.erb")
    end
  end

  def edit
    @purpose_statement = PurposeStatement.find(params[:id])

    render("purpose_statements/edit.html.erb")
  end

  def update
    @purpose_statement = PurposeStatement.find(params[:id])

    @purpose_statement.user_id = params[:user_id]

    save_status = @purpose_statement.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/purpose_statements/#{@purpose_statement.id}/edit", "/update_purpose_statement"
        redirect_to("/purpose_statements/#{@purpose_statement.id}", :notice => "Purpose statement updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Purpose statement updated successfully.")
      end
    else
      render("purpose_statements/edit.html.erb")
    end
  end

  def destroy
    @purpose_statement = PurposeStatement.find(params[:id])

    @purpose_statement.destroy

    if URI(request.referer).path == "/purpose_statements/#{@purpose_statement.id}"
      redirect_to("/", :notice => "Purpose statement deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Purpose statement deleted.")
    end
  end
end
