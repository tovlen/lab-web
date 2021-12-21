require 'rails_helper'

RSpec.describe LabworksController, type: :controller do
    
    let(:user) { create :user }
    let(:params) { { user_id: user } }
    
    describe '#index' do
    
        subject { get :index, params: params }
        
        let!(:labwork) { create :labwork, user: user }
        
        it 'assigns @labwork' do
            
            subject
            expect(assigns(:labworks)).to eq([labwork])
        
        end
        
        it { is_expected.to render_template('index') }
    
    end
    
    describe '#new' do
        
        subject { get :new, params: params }
        
        it { is_expected.to render_template(:new) }
        
        it 'Create new labwork' do
            
            subject
            expect(assigns(:labwork)).to be_a_new Labwork

        end

    end

    describe '#edit' do
        
        let!(:labwork) { create :labwork, user: user }
        let(:params) { { id: labwork, user_id: user } }

        subject { process :edit, method: :get, params: params }

        it { is_expected.to render_template(:edit) }

        it 'Assigns server policy' do

        subject
        expect(assigns :labwork).to eq labwork

        end

    end

    describe '#update' do

        let!(:labwork) { create :labwork, user: user }
        let(:params) { { id: labwork, user_id: user, labwork: { title: 'Some title' } } }

        subject { process :update, method: :put, params: params }

        it 'Updates labwork' do
        expect { subject }.to change { labwork.reload.title }.to('Some title')
        end

        context 'With bad params' do
            
            let(:params) { { id: labwork, user_id: user, labwork: { title: '' } } }
            
            it 'Does not update labwork' do

                expect { subject }.not_to change { labwork.reload.title }

            end
        
        end

    end


    describe '#show' do

        let(:params) { { user_id: user.id, id: labwork } }

        subject { get :show, params: params }

        let!(:labwork) { create :labwork, user: user }

        it 'Assigns @labwork' do

            subject
            expect(assigns(:labwork)).to eq(labwork)

        end

        it { is_expected.to render_template(:show) }

    end

    describe '#destroy' do

        let!(:labwork) { create :labwork, user: user }
        let(:params) { { id: labwork, user_id: user } }

        subject { process :destroy, method: :delete, params: params }

        it 'Delete post' do

        expect { subject }.to change { Labwork.count }.by(-1)

        end

    end

    describe '#mark' do

        let!(:labwork) { create :labwork, user: user }
        let(:params) { { id: labwork, user_id: user } }

        subject { process :mark, method: :get, params: params }

        it { is_expected.to render_template(:mark) }

        it 'assigns server policy' do

            subject
            expect(assigns :labwork).to eq labwork

        end

    end

end