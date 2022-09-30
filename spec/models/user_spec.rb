require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user) {create(:user)}
  let(:user2) {create(:user)}

  context 'User validation' do

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without a last name' do
      user.last_name = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'is not valid with repeated emails' do
      user.email = user2.email
      expect(user).not_to be_valid
    end
  end

  context 'User associations' do

    it 'should have many courses' do
      courses = User.reflect_on_association(:courses)
      expect(courses.macro).to eq(:has_many)
    end

    it 'should have many reviews' do
      reviews = User.reflect_on_association(:reviews)
      expect(reviews.macro).to eq(:has_many)
    end

    it 'should have many inscriptions' do
      inscriptions = User.reflect_on_association(:inscriptions)
      expect(inscriptions.macro).to eq(:has_many)
    end

    it 'should have many course inscriptions' do
      course_inscriptions = User.reflect_on_association(:course_inscriptions)
      expect(course_inscriptions.macro).to eq(:has_many)
    end
  end

end