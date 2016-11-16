Rails.application.routes.draw do
  root :to => "organizations#index"
  # Routes for the Sr_skill resource:
  # CREATE
  get "/sr_skills/new", :controller => "sr_skills", :action => "new"
  post "/create_sr_skill", :controller => "sr_skills", :action => "create"

  # READ
  get "/sr_skills", :controller => "sr_skills", :action => "index"
  get "/sr_skills/:id", :controller => "sr_skills", :action => "show"

  # UPDATE
  get "/sr_skills/:id/edit", :controller => "sr_skills", :action => "edit"
  post "/update_sr_skill/:id", :controller => "sr_skills", :action => "update"

  # DELETE
  get "/delete_sr_skill/:id", :controller => "sr_skills", :action => "destroy"
  #------------------------------

  # Routes for the Sr_purpose_statement resource:
  # CREATE
  get "/sr_purpose_statements/new", :controller => "sr_purpose_statements", :action => "new"
  post "/create_sr_purpose_statement", :controller => "sr_purpose_statements", :action => "create"

  # READ
  get "/sr_purpose_statements", :controller => "sr_purpose_statements", :action => "index"
  get "/sr_purpose_statements/:id", :controller => "sr_purpose_statements", :action => "show"

  # UPDATE
  get "/sr_purpose_statements/:id/edit", :controller => "sr_purpose_statements", :action => "edit"
  post "/update_sr_purpose_statement/:id", :controller => "sr_purpose_statements", :action => "update"

  # DELETE
  get "/delete_sr_purpose_statement/:id", :controller => "sr_purpose_statements", :action => "destroy"
  #------------------------------

  # Routes for the Sr_bullet resource:
  # CREATE
  get "/sr_bullets/new", :controller => "sr_bullets", :action => "new"
  post "/create_sr_bullet", :controller => "sr_bullets", :action => "create"

  # READ
  get "/sr_bullets", :controller => "sr_bullets", :action => "index"
  get "/sr_bullets/:id", :controller => "sr_bullets", :action => "show"

  # UPDATE
  get "/sr_bullets/:id/edit", :controller => "sr_bullets", :action => "edit"
  post "/update_sr_bullet/:id", :controller => "sr_bullets", :action => "update"

  # DELETE
  get "/delete_sr_bullet/:id", :controller => "sr_bullets", :action => "destroy"
  #------------------------------

  # Routes for the Saved_resume resource:
  # CREATE
  get "/saved_resumes/new", :controller => "saved_resumes", :action => "new"
  post "/create_saved_resume", :controller => "saved_resumes", :action => "create"

  # READ
  get "/saved_resumes", :controller => "saved_resumes", :action => "index"
  get "/saved_resumes/:id", :controller => "saved_resumes", :action => "show"

  # UPDATE
  get "/saved_resumes/:id/edit", :controller => "saved_resumes", :action => "edit"
  post "/update_saved_resume/:id", :controller => "saved_resumes", :action => "update"

  # DELETE
  get "/delete_saved_resume/:id", :controller => "saved_resumes", :action => "destroy"
  #------------------------------

  # Routes for the Skill resource:
  # CREATE
  get "/skills/new", :controller => "skills", :action => "new"
  post "/create_skill", :controller => "skills", :action => "create"

  # READ
  get "/skills", :controller => "skills", :action => "index"
  get "/skills/:id", :controller => "skills", :action => "show"

  # UPDATE
  get "/skills/:id/edit", :controller => "skills", :action => "edit"
  post "/update_skill/:id", :controller => "skills", :action => "update"

  # DELETE
  get "/delete_skill/:id", :controller => "skills", :action => "destroy"
  #------------------------------

  # Routes for the Purpose_statement resource:
  # CREATE
  get "/purpose_statements/new", :controller => "purpose_statements", :action => "new"
  post "/create_purpose_statement", :controller => "purpose_statements", :action => "create"

  # READ
  get "/purpose_statements", :controller => "purpose_statements", :action => "index"
  get "/purpose_statements/:id", :controller => "purpose_statements", :action => "show"

  # UPDATE
  get "/purpose_statements/:id/edit", :controller => "purpose_statements", :action => "edit"
  post "/update_purpose_statement/:id", :controller => "purpose_statements", :action => "update"

  # DELETE
  get "/delete_purpose_statement/:id", :controller => "purpose_statements", :action => "destroy"
  #------------------------------

  # Routes for the Bullet_tag resource:
  # CREATE
  get "/bullet_tags/new", :controller => "bullet_tags", :action => "new"
  post "/create_bullet_tag", :controller => "bullet_tags", :action => "create"

  # READ
  get "/bullet_tags", :controller => "bullet_tags", :action => "index"
  get "/bullet_tags/:id", :controller => "bullet_tags", :action => "show"

  # UPDATE
  get "/bullet_tags/:id/edit", :controller => "bullet_tags", :action => "edit"
  post "/update_bullet_tag/:id", :controller => "bullet_tags", :action => "update"

  # DELETE
  get "/delete_bullet_tag/:id", :controller => "bullet_tags", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Tag resource:
  # CREATE
  get "/tags/new", :controller => "tags", :action => "new"
  post "/create_tag", :controller => "tags", :action => "create"

  # READ
  get "/tags", :controller => "tags", :action => "index"
  get "/tags/:id", :controller => "tags", :action => "show"

  # UPDATE
  get "/tags/:id/edit", :controller => "tags", :action => "edit"
  post "/update_tag/:id", :controller => "tags", :action => "update"

  # DELETE
  get "/delete_tag/:id", :controller => "tags", :action => "destroy"
  #------------------------------

  # Routes for the Bullet resource:
  # CREATE
  get "/bullets/new", :controller => "bullets", :action => "new"
  post "/create_bullet", :controller => "bullets", :action => "create"

  # READ
  get "/bullets", :controller => "bullets", :action => "index"
  get "/bullets/:id", :controller => "bullets", :action => "show"

  # UPDATE
  get "/bullets/:id/edit", :controller => "bullets", :action => "edit"
  post "/update_bullet/:id", :controller => "bullets", :action => "update"

  # DELETE
  get "/delete_bullet/:id", :controller => "bullets", :action => "destroy"
  #------------------------------

  # Routes for the Organization resource:
  # CREATE
  get "/organizations/new", :controller => "organizations", :action => "new"
  post "/create_organization", :controller => "organizations", :action => "create"

  # READ
  get "/organizations", :controller => "organizations", :action => "index"
  get "/organizations/:id", :controller => "organizations", :action => "show"

  # UPDATE
  get "/organizations/:id/edit", :controller => "organizations", :action => "edit"
  post "/update_organization/:id", :controller => "organizations", :action => "update"

  # DELETE
  get "/delete_organization/:id", :controller => "organizations", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
