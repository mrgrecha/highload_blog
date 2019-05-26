require "rails_helper"

RSpec.describe PostForm do

  let(:post_form) { PostForm.new }
  let(:valid_post_attributes) {  { author_login: 'test', title: 'test', body: 'test', author_ip_address: '149.3.93.169' } }

  RSpec.shared_examples 'an invalid data in request' do
    before do
      post_form.attributes = invalid_post_attributes
    end

    it 'returns false' do
      expect(post_form.save).to be_falsy
    end
  end

  describe '.save' do

    context "when author's login is an empty string" do
      it_behaves_like 'an invalid data in request' do
        let(:invalid_post_attributes) { valid_post_attributes.merge(author_login: '') }
      end
    end

    context 'when author_ip_address is incorrect' do
      it_behaves_like 'an invalid data in request' do
        let(:invalid_post_attributes) { valid_post_attributes.merge(author_ip_address: '3123123') }
      end
    end

    context 'when body of post is empty' do
      it_behaves_like 'an invalid data in request' do
        let(:invalid_post_attributes) { valid_post_attributes.merge(body: '') }
      end
    end

    context 'when title of post is empty' do
      it_behaves_like 'an invalid data in request' do
        let(:invalid_post_attributes) { valid_post_attributes.merge(title: '') }
      end
    end

    context 'when data is correct' do
      before do
        post_form.attributes = valid_post_attributes
      end

      it 'returns a created record' do
        expect(post_form.save).to be_instance_of(Post)
      end
    end
  end
end
