class SrBulletsController < ApplicationController
  def index
    @q = SrBullet.ransack(params[:q])
    @sr_bullets = @q.result(:distinct => true).includes(:bullets, :resume).page(params[:page]).per(10)

    render("sr_bullets/index.html.erb")
  end

  def show
    @sr_bullet = SrBullet.find(params[:id])

    render("sr_bullets/show.html.erb")
  end

  def new
    @sr_bullet = SrBullet.new

    render("sr_bullets/new.html.erb")
  end

  def create
    @sr_bullet = SrBullet.new

    @sr_bullet.bullets_id = params[:bullets_id]
    @sr_bullet.resume_id = params[:resume_id]

    save_status = @sr_bullet.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sr_bullets/new", "/create_sr_bullet"
        redirect_to("/sr_bullets")
      else
        redirect_back(:fallback_location => "/", :notice => "Sr bullet created successfully.")
      end
    else
      render("sr_bullets/new.html.erb")
    end
  end

  def edit
    @sr_bullet = SrBullet.find(params[:id])

    render("sr_bullets/edit.html.erb")
  end

  def update
    @sr_bullet = SrBullet.find(params[:id])

    @sr_bullet.bullets_id = params[:bullets_id]
    @sr_bullet.resume_id = params[:resume_id]

    save_status = @sr_bullet.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/sr_bullets/#{@sr_bullet.id}/edit", "/update_sr_bullet"
        redirect_to("/sr_bullets/#{@sr_bullet.id}", :notice => "Sr bullet updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Sr bullet updated successfully.")
      end
    else
      render("sr_bullets/edit.html.erb")
    end
  end

  def destroy
    @sr_bullet = SrBullet.find(params[:id])

    @sr_bullet.destroy

    if URI(request.referer).path == "/sr_bullets/#{@sr_bullet.id}"
      redirect_to("/", :notice => "Sr bullet deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Sr bullet deleted.")
    end
  end
end
