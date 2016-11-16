class SrSkillsController < ApplicationController
  def index
    @sr_skills = SrSkill.page(params[:page]).per(10)

    render("sr_skills/index.html.erb")
  end

  def show
    @sr_skill = SrSkill.find(params[:id])

    render("sr_skills/show.html.erb")
  end

  def new
    @sr_skill = SrSkill.new

    render("sr_skills/new.html.erb")
  end

  def create
    @sr_skill = SrSkill.new

    @sr_skill.resume_id = params[:resume_id]
    @sr_skill.skills_id = params[:skills_id]

    save_status = @sr_skill.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sr_skills/new", "/create_sr_skill"
        redirect_to("/sr_skills")
      else
        redirect_back(:fallback_location => "/", :notice => "Sr skill created successfully.")
      end
    else
      render("sr_skills/new.html.erb")
    end
  end

  def edit
    @sr_skill = SrSkill.find(params[:id])

    render("sr_skills/edit.html.erb")
  end

  def update
    @sr_skill = SrSkill.find(params[:id])

    @sr_skill.resume_id = params[:resume_id]
    @sr_skill.skills_id = params[:skills_id]

    save_status = @sr_skill.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sr_skills/#{@sr_skill.id}/edit", "/update_sr_skill"
        redirect_to("/sr_skills/#{@sr_skill.id}", :notice => "Sr skill updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Sr skill updated successfully.")
      end
    else
      render("sr_skills/edit.html.erb")
    end
  end

  def destroy
    @sr_skill = SrSkill.find(params[:id])

    @sr_skill.destroy

    if URI(request.referer).path == "/sr_skills/#{@sr_skill.id}"
      redirect_to("/", :notice => "Sr skill deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Sr skill deleted.")
    end
  end
end
