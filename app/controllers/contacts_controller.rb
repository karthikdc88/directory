class ContactsController < ApplicationController
  
  before_filter :authenticate_user!
  
  before_action :load_contact, only: :create
  load_and_authorize_resource
  
  def index
  	@contacts = Contact.all
  end

  
  def new
  	@contact = Contact.new
  end

  
  def create
  	@contact = Contact.new(contact_params)
  	if @contact.save
  		redirect_to contacts_path, notice: "Successfully created a new Contact"
  	else
  		render action: "new"
  	end
  end

  
  def edit
  	@contact = Contact.find(params[:id])
  end

  
  def update
     @contact = Contact.find(params[:id])
     if @contact.update_attributes(contact_params)
     	redirect_to contacts_path, notice: "Successfully update the contact"
     else
     	render action: "edit"
     end
  end

  
  def destroy
  	@contact = Contact.find(params[:id])
  	@contact.destroy
  	redirect_to contacts_path, notice: "Successfully delete the contact"
  end

  def show
  	@contact = Contact.find(params[:id])
  end

  private

  def contact_params
      params[:contact].permit(:name, :age, :mobile_no, :email, :occupation, :designation, :company_name, :college_name, :course, :semester)    
  end
  
  def load_contact
      @contact = Contact.new(contact_params)
  end
  
end
