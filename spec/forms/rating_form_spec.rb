require "rails_helper"

RSpec.describe RatingForm do

  # Usually I'd like to create a factory for each class but I'd like leave it in such way for now :)
  let(:rating_form) { RatingForm.new }
  let!(:author) { User.create(login: 'test') }
  let!(:ip_address) { IpAddress.create(value: '226.252.149.227') }
  let!(:post) { Post.create(author_id: author.id, title: '1', body: '2', ip_address: ip_address) }
  let(:valid_rating_attributes) {  { value: 4, post_id: post.id } }

  RSpec.shared_examples 'an invalid data in request' do
    before do
      rating_form.attributes = invalid_rating_attributes
    end

    it 'returns false' do
      expect(rating_form.save).to be_falsy
    end
  end

  describe '.save' do

    context 'when rating value is less than 1' do
      it_behaves_like 'an invalid data in request' do
        let(:invalid_rating_attributes) { valid_rating_attributes.merge(value: 0) }
      end
    end

    context 'when rating value is greater than 5' do
      it_behaves_like 'an invalid data in request' do
        let(:invalid_rating_attributes) { valid_rating_attributes.merge(value: 6) }
      end
    end

    context 'when post does not exist' do
      it_behaves_like 'an invalid data in request' do
        let(:invalid_rating_attributes) { valid_rating_attributes.merge(post_id: -1) }
      end
    end

    context 'when data is correct' do
      before do
        rating_form.attributes = valid_rating_attributes
      end

      it 'returns an average rating for this post' do
        expect(rating_form.save).to eq Rating.where(post_id: post.id).average(:value)
      end
    end
  end
end
