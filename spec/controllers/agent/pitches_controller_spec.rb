require 'spec_helper'

describe Agent::PitchesController do

  # This should return the minimal set of attributes required to create a valid
  # Pitch. As you add validations to Pitch, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "min" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PitchesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all pitches as @pitches" do
      pitch = Pitch.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:pitches)).to eq([pitch])
    end
  end

  describe "GET show" do
    it "assigns the requested pitch as @pitch" do
      pitch = Pitch.create! valid_attributes
      get :show, {:id => pitch.to_param}, valid_session
      expect(assigns(:pitch)).to eq(pitch)
    end
  end

  describe "GET new" do
    it "assigns a new pitch as @pitch" do
      get :new, {}, valid_session
      expect(assigns(:pitch)).to be_a_new(Pitch)
    end
  end

  describe "GET edit" do
    it "assigns the requested pitch as @pitch" do
      pitch = Pitch.create! valid_attributes
      get :edit, {:id => pitch.to_param}, valid_session
      expect(assigns(:pitch)).to eq(pitch)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Pitch" do
        expect {
          post :create, {:pitch => valid_attributes}, valid_session
        }.to change(Pitch, :count).by(1)
      end

      it "assigns a newly created pitch as @pitch" do
        post :create, {:pitch => valid_attributes}, valid_session
        expect(assigns(:pitch)).to be_a(Pitch)
        expect(assigns(:pitch)).to be_persisted
      end

      it "redirects to the created pitch" do
        post :create, {:pitch => valid_attributes}, valid_session
        expect(response).to redirect_to(Pitch.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pitch as @pitch" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pitch.any_instance.stub(:save).and_return(false)
        post :create, {:pitch => { "min" => "invalid value" }}, valid_session
        expect(assigns(:pitch)).to be_a_new(Pitch)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pitch.any_instance.stub(:save).and_return(false)
        post :create, {:pitch => { "min" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pitch" do
        pitch = Pitch.create! valid_attributes
        # Assuming there are no other pitches in the database, this
        # specifies that the Pitch created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Pitch).to receive(:update).with({ "min" => "1" })
        put :update, {:id => pitch.to_param, :pitch => { "min" => "1" }}, valid_session
      end

      it "assigns the requested pitch as @pitch" do
        pitch = Pitch.create! valid_attributes
        put :update, {:id => pitch.to_param, :pitch => valid_attributes}, valid_session
        expect(assigns(:pitch)).to eq(pitch)
      end

      it "redirects to the pitch" do
        pitch = Pitch.create! valid_attributes
        put :update, {:id => pitch.to_param, :pitch => valid_attributes}, valid_session
        expect(response).to redirect_to(pitch)
      end
    end

    describe "with invalid params" do
      it "assigns the pitch as @pitch" do
        pitch = Pitch.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pitch.any_instance.stub(:save).and_return(false)
        put :update, {:id => pitch.to_param, :pitch => { "min" => "invalid value" }}, valid_session
        expect(assigns(:pitch)).to eq(pitch)
      end

      it "re-renders the 'edit' template" do
        pitch = Pitch.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pitch.any_instance.stub(:save).and_return(false)
        put :update, {:id => pitch.to_param, :pitch => { "min" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pitch" do
      pitch = Pitch.create! valid_attributes
      expect {
        delete :destroy, {:id => pitch.to_param}, valid_session
      }.to change(Pitch, :count).by(-1)
    end

    it "redirects to the pitches list" do
      pitch = Pitch.create! valid_attributes
      delete :destroy, {:id => pitch.to_param}, valid_session
      expect(response).to redirect_to(pitches_url)
    end
  end

end
