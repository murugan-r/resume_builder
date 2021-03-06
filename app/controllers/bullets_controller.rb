class BulletsController < ApplicationController
  def index
    @q = Bullet.ransack(params[:q])
    @bullets = @q.result(:distinct => true).includes(:organization, :bullet_tags, :sr_bullets).page(params[:page]).per(10)

    render("bullets/index.html.erb")
  end

  def show
    @sr_bullet = SrBullet.new
    @bullet_tag = BulletTag.new
    @bullet = Bullet.find(params[:id])

    render("bullets/show.html.erb")
  end

  def new
    @bullet = Bullet.new

    render("bullets/new.html.erb")
  end

  def create
    @bullet = Bullet.new

    @bullet.organization_id = params[:organization_id]

    save_status = @bullet.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bullets/new", "/create_bullet"
        redirect_to("/bullets")
      else
        redirect_back(:fallback_location => "/", :notice => "Bullet created successfully.")
      end
    else
      render("bullets/new.html.erb")
    end
  end

  def edit
    @bullet = Bullet.find(params[:id])

    render("bullets/edit.html.erb")
  end

  def update
    @bullet = Bullet.find(params[:id])

    @bullet.organization_id = params[:organization_id]

    save_status = @bullet.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bullets/#{@bullet.id}/edit", "/update_bullet"
        redirect_to("/bullets/#{@bullet.id}", :notice => "Bullet updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bullet updated successfully.")
      end
    else
      render("bullets/edit.html.erb")
    end
  end

  def destroy
    @bullet = Bullet.find(params[:id])

    @bullet.destroy

    if URI(request.referer).path == "/bullets/#{@bullet.id}"
      redirect_to("/", :notice => "Bullet deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bullet deleted.")
    end
  end
end
