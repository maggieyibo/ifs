require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  describe 'GET index' do
    let!(:post1) {Post.create!(title: 'All about Cats', body: 'This is a post about cats.')}
    let!(:post2) {Post.create!(title: 'All about Cats', body: 'This is a post about cats.')}

    before(:each) {
      get :index
    }

    it "is successful" do
      expect(response).to be_success
    end

    it "assigns all posts to posts" do
      expect(assigns(:posts)).to include(post1, post2)
    end

    it "renders the new template" do
      expect(response).to render_template :index
    end
  end

  describe 'GET show' do
    let!(:post) {Post.create!(title: 'All about Cats', body: 'This is a post about cats.')}

    before(:each) {
      get :show, id: post.id
    }

    it "is successful" do
      expect(response).to be_success
    end

    it "renders the new template" do
      expect(response).to render_template :show
    end
  end


  describe 'GET new' do
    it "is successful" do
      get :new
      expect(response).to be_success
    end

    it "renders the new view file" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new post to a variable post" do
      get :new
      expect(assigns(:post)).to be_a(Post)
    end

    it "doesn't save any new records" do
      expect{get :new}.to change(Post, :count).by(0)
    end

  end



  describe 'POST create' do

    context "when form is valid" do 
      let!(:valid_attributes) do
        {title: 'All about Cats', body: 'This is a post about cats.'}
      end
      
      it "added a post record" do
        expect{post :create, post: valid_attributes}.to change(Post, :count).by(1)
      end

      it "redirects to the index" do
        post :create, post: valid_attributes
        expect(response).to redirect_to posts_path
      end
    end

    context "when form is invalid" do
      let!(:bad_attributes) do
        {title: nil, body: nil}
      end

      it "does not add a post record" do
        expect{ post :create, post: bad_attributes }.to change(Post, :count).by(0)
      end

      it "renders the new view file" do
        post :create, post: bad_attributes
        expect(response).to render_template(:new)
      end

    end

  end

  describe 'GET edit' do
    let!(:post) {Post.create!(title: 'All about Cats', body: 'This is a post about cats.')}

    before(:each) {
      get :edit, id: post.id
    }

    it "is successful" do
      expect(response).to be_success
    end

    it "renders the edit view file" do
      expect(response).to render_template :edit
    end

    it "assigns the requested post to a variable post" do
      expect(assigns(:post)).to eq(post)
    end
  end

  describe 'PUT update' do
    let!(:post) {Post.create!(title: 'All about Cats', body: 'This is a post about cats.')}

    context "when form is valid" do 
      let!(:valid_attributes) do
        {title: 'All about Fat Cats', body: 'This is a post about cats.'}
      end

      it "updates the existing post" do
        put :update, id: post.id, post: valid_attributes
        expect(post.reload.title).to eq(valid_attributes[:title])
      end

      it "renders the edit view file" do
        put :update, id: post.id, post: valid_attributes
        expect(response).to redirect_to posts_path
      end

    end

    context "when form is invalid" do
      let!(:bad_attributes) do
        {title: nil, body: 'This is a post about cats.'}
      end

      it "does not updates the existing post" do
        put :update, id: post.id, post: bad_attributes
        expect(post.reload.title).to eq(post.title)
      end

      it "does not render the edit view file" do
        put :update, id: post.id, post: bad_attributes
        expect(response).to render_template :edit
      end

    end

  end


  describe 'DELETE destroy' do

    let!(:post) { Post.create!(title: 'All about Cats', body: 'This is a post about cats.')}

    it "should assign the post to a variable post" do
      delete :destroy, id: post.id
      expect(assigns(:post)).to eq(post)
    end

    it "should destroy a post record" do
      expect{ delete :destroy, id: post.id }.to change(Post, :count).by(-1)      
    end

  end

end







