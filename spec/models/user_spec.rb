# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  events                 :string           default([]), is an Array
#  last_sign_out_at       :datetime
#  name                   :string
#  provider               :string
#  uid                    :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  admin                  :boolean
#

require 'rails_helper'

RSpec.describe User do
  
  before :each do
    @user = create :user
  end

  let(:category) { create :category }

  it { expect(@user).to respond_to(:events) }
  it { expect(@user).to respond_to(:comments) }
  it { expect(@user).to respond_to(:likes) }
  it { expect(@user).to respond_to(:categories) }

  context 'follows and unfollows' do
    it 'categories' do
      @user.categories << category
      expect(@user.categories.length).to eq 1
      @user.categories.destroy_all
      expect(@user.categories).to eq []
    end
  end

  context 'email' do
    it 'is invalid' do
      @user.email = nil
      @user.save
      expect(@user.errors[:email]).not_to be_nil
      expect{ @user.save! }.to raise_error ActiveRecord::RecordInvalid
    end
    it 'is valid' do
      @user.save
      expect(@user.errors[:email]).to eq []
      expect{ @user.save! }.not_to raise_error
    end
  end

  context 'password' do
    it 'exists' do
      expect(@user.password).not_to be_blank
    end
    it 'length >= 6' do
      expect(@user.password.length).to be >= 6
    end
  end

  context 'status' do
    it 'isnt admin' do
      expect(@user.admin).to be false
    end
  end

end
