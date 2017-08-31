class UsersController < ApplicationController
  if respond_to?(:before_action)
    before_action :redirect_signed_in_users, only: %i[create new]
    skip_before_action :require_login, only: %i[create new], raise: false
    skip_before_action :authorize, only: %i[create new], raise: false
  else
    before_filter :redirect_signed_in_users, only: %i[create new]
    skip_before_filter :require_login, only: %i[create new], raise: false
    skip_before_filter :authorize, only: %i[create new], raise: false
  end

  def new
    @user = user_from_params
    render template: 'users/new', flash: "kikoo"
  end

  def create
    @user = user_from_params
    if @user.save
      sign_in @user
      # TODO redirect to landing
      redirect_back_or url_after_create
    else
      render template: 'users/new', flash: "Le compte n'a pas pu être créé."
    end
  end

  private

  def avoid_sign_in
    warn "[DEPRECATION] Clearance's `avoid_sign_in` before_filter is " \
         'deprecated. Use `redirect_signed_in_users` instead. ' \
         'Be sure to update any instances of `skip_before_filter :avoid_sign_in`' \
         ' or `skip_before_action :avoid_sign_in` as well'
    redirect_signed_in_users
  end

  def redirect_signed_in_users
    redirect_to Clearance.configuration.redirect_url if signed_in?
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    name = user_params.delete(:name)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.name = name
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || {}
  end
end
