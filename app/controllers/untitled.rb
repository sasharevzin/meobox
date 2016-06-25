pages_controller

def home
    @plan_1 = Plan.find_by_name('Basic Membership')
    @plan_2 = Plan.find_by_name('Silver Membership')
    @plan_3 = Plan.find_by_name('Gold Membership')
  end

  registration_controller

  def create    
    @plan = Plan.find_by_name(params[:plan_name])
    @user = User.find(params[:user_id])
    # attach the plan to the user
    if @user.already_registered_for?(@plan)
      flash[:notice] = "You are already subscribed to #{@plan.name}!"
    else
      flash[:notice] = "Successfully subscribed to #{@plan.name}!"
      Registration.create(user_id: @user.id, plan_id: @plan.id)      
    end        
    redirect_to @plan
  end

  def destroy
    @plan = Plan.find_by_name(params[:plan_name])
    @user = User.find(params[:user_id])
    Registration.where(user_id: @user.id, plan_id: @plan.id).destroy
    flash[:notice] = "You are  unsubscribed to #{@plan.name}!"
    redirect_to :root
  end

  plan model added association and validation for plan
  Plan.rb
   has_many :users, through: :registrations

  validates_presence_of :name, :description, :price


  added validations for Registraion model registration.rb
   validates :plan, :uniqueness => {:scope => :user}