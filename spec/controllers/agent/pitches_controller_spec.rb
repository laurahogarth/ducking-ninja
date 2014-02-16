require 'spec_helper'

describe Agent::PitchesController do

  before do
    @agent = FactoryGirl.create(:agent)
    @holiday = FactoryGirl.create(:holiday)
    @pitch = FactoryGirl.create(:pitch, :holiday => @holiday, :agent => @agent)
    sign_in :agent, @agent
  end 

  describe "GET index" do
    it "assigns all pitches as @pitches" do
      get :index
      expect(assigns(:pitches)).to eq([@pitch])
    end
  end

  describe "GET show" do
    it "assigns the requested pitch as @pitch" do
      get :show, {:holiday_id => @holiday, :id => @pitch}
      expect(assigns(:pitch)).to eq(@pitch)
      expect(assigns(:holiday)).to eq(@holiday)
    end
  end

  describe "GET new" do
    it "assigns a new pitch as @pitch" do
      get :new, {:holiday_id => @holiday }
      expect(assigns(:holiday)).to eq(@holiday)
    end
  end

  describe "GET edit" do
    it "assigns the requested pitch as @pitch" do
      get :edit, {:holiday_id => @holiday, :id => @pitch}
      expect(assigns(:pitch)).to eq(@pitch)
      expect(assigns(:holiday)).to eq(@holiday)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Pitch" do
        expect {
          @pitch.holiday = FactoryGirl.create(:holiday)
          post :create, {:holiday_id => @holiday, :pitch => FactoryGirl.attributes_for(:pitch) }
        }.to change(Pitch, :count).by(1)
      end

      it "assigns a newly created pitch as @pitch and redirects" do
        @pitch.holiday = FactoryGirl.create(:holiday)
        post :create, {:holiday_id => @holiday, :pitch => FactoryGirl.attributes_for(:pitch) }
        expect(assigns(:pitch)).to be_persisted
        expect(response).to redirect_to([:agent, @holiday, assigns[:pitch]])
      end
    end
  end


  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pitch" do
        put :update, { :holiday_id => @holiday, :id => @pitch, :pitch => FactoryGirl.attributes_for(:pitch) }
        expect(assigns[:pitch]).to be_persisted
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pitch" do
      expect {
        delete :destroy, {:holiday_id => @holiday, :id => @pitch} 
      }.to change(Pitch, :count).by(-1)
    end

    it "redirects to the pitches list" do
      delete :destroy, {:holiday_id => @holiday, :id => @pitch}
      expect(response).to redirect_to(agent_pitches_url)
    end
  end

end
