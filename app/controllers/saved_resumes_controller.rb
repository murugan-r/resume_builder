class SavedResumesController < ApplicationController
  def index
    @saved_resumes = SavedResume.page(params[:page]).per(10)

    render("saved_resumes/index.html.erb")
  end

  def show
    @sr_purpose_statement = SrPurposeStatement.new
    @sr_bullet = SrBullet.new
    @sr_skill = SrSkill.new
    @saved_resume = SavedResume.find(params[:id])

    render("saved_resumes/show.html.erb")
  end

  def new
    @saved_resume = SavedResume.new

    render("saved_resumes/new.html.erb")
  end

  def create
    @saved_resume = SavedResume.new

    @saved_resume.user_id = params[:user_id]
    @saved_resume.resume_name = params[:resume_name]

    save_status = @saved_resume.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/saved_resumes/new", "/create_saved_resume"
        redirect_to("/saved_resumes")
      else
        redirect_back(:fallback_location => "/", :notice => "Saved resume created successfully.")
      end
    else
      render("saved_resumes/new.html.erb")
    end
  end

  def edit
    @saved_resume = SavedResume.find(params[:id])

    render("saved_resumes/edit.html.erb")
  end

  def update
    @saved_resume = SavedResume.find(params[:id])

    @saved_resume.user_id = params[:user_id]
    @saved_resume.resume_name = params[:resume_name]

    save_status = @saved_resume.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/saved_resumes/#{@saved_resume.id}/edit", "/update_saved_resume"
        redirect_to("/saved_resumes/#{@saved_resume.id}", :notice => "Saved resume updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Saved resume updated successfully.")
      end
    else
      render("saved_resumes/edit.html.erb")
    end
  end

  def destroy
    @saved_resume = SavedResume.find(params[:id])

    @saved_resume.destroy

    if URI(request.referer).path == "/saved_resumes/#{@saved_resume.id}"
      redirect_to("/", :notice => "Saved resume deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Saved resume deleted.")
    end
  end
end
