class ContactsController < ApplicationController
  def index
    render json: {
      owned: User.find(params[:user_id]).contacts,
      shared: User.find(params[:user_id]).shared_contacts
    }
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    @contact = Contact.find(params[:user_id])
    @contact.update!(contact_params)
    render json: @contact
  end

  def show
    render json: Contact.find(params[:user_id])
  end

  def destroy
    Contact.find(params[:user_id]).destroy!
    render json: Contact.all
  end

  private

  def contact_params
    params[:contact].permit(:name, :email, :user_id)
  end

end
