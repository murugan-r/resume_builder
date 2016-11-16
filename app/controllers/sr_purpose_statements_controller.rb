class SrPurposeStatementsController < ApplicationController
  def index
    @sr_purpose_statements = SrPurposeStatement.all

    render("sr_purpose_statements/index.html.erb")
  end

  def show
    @sr_purpose_statement = SrPurposeStatement.find(params[:id])

    render("sr_purpose_statements/show.html.erb")
  end

  def new
    @sr_purpose_statement = SrPurposeStatement.new

    render("sr_purpose_statements/new.html.erb")
  end

  def create
    @sr_purpose_statement = SrPurposeStatement.new

    @sr_purpose_statement.purpose_statements_id = params[:purpose_statements_id]
    @sr_purpose_statement.resume_id = params[:resume_id]

    save_status = @sr_purpose_statement.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sr_purpose_statements/new", "/create_sr_purpose_statement"
        redirect_to("/sr_purpose_statements")
      else
        redirect_back(:fallback_location => "/", :notice => "Sr purpose statement created successfully.")
      end
    else
      render("sr_purpose_statements/new.html.erb")
    end
  end

  def edit
    @sr_purpose_statement = SrPurposeStatement.find(params[:id])

    render("sr_purpose_statements/edit.html.erb")
  end

  def update
    @sr_purpose_statement = SrPurposeStatement.find(params[:id])

    @sr_purpose_statement.purpose_statements_id = params[:purpose_statements_id]
    @sr_purpose_statement.resume_id = params[:resume_id]

    save_status = @sr_purpose_statement.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sr_purpose_statements/#{@sr_purpose_statement.id}/edit", "/update_sr_purpose_statement"
        redirect_to("/sr_purpose_statements/#{@sr_purpose_statement.id}", :notice => "Sr purpose statement updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Sr purpose statement updated successfully.")
      end
    else
      render("sr_purpose_statements/edit.html.erb")
    end
  end

  def destroy
    @sr_purpose_statement = SrPurposeStatement.find(params[:id])

    @sr_purpose_statement.destroy

    if URI(request.referer).path == "/sr_purpose_statements/#{@sr_purpose_statement.id}"
      redirect_to("/", :notice => "Sr purpose statement deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Sr purpose statement deleted.")
    end
  end
end
