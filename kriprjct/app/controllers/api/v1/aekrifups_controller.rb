=begin
module Api
  module V1
    class AekrifupsController < ApplicationController
      def index
        aekrifups = Aekrifup.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded ', data:aekrifups},status: :ok
      end
    end
  end
end
=end
module Api
  module V1
    class AekrifupsController < ApplicationController
      def index

        aekrifups = Aekrifup.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded ', data:aekrifups},status: :ok
      end
      def show
        aekrifup = Aekrifup.find(params[:id])
        render json: {status: 'SUCCESS',message:'Loaded banana', data:aekrifup},status: :ok
      end


      def create
        aekrifup = Aekrifup.new(article_params)
        if aekrifup.save
          render json: {status: 'SUCCESS',message:'Saved banana', data:aekrifup},status: :ok
        else

          render json: {status: 'Error',message:' article not saved', data:aekrifup.errors},status: :unprocessable_entity
        end

      end

      def destroy
        aekrifup = Aekrifup.find(params[:id])
        ae.destroy
        render json: {status: 'SUCCESS',message:'delete banana', data:aekrifup},status: :ok

      end

      def update
        aekrifup= Aekrifup.find(params[:id])
        if ae.update_attributes(aekrifup_params)
           render json: {status: 'SUCCESS',message:'update article', data:aekrifup},status: :ok
        else
           render json: {status: 'Error',message:' article not updated', data:aekrifup.errors},status: :unprocessable_entity
        end
      end

      private
      def article_params
        params.permit(:PATIENT_ID, :SITE_NAME, :COUNTRY_NAME, :FOLLOW_UP)
      end
    end
  end
end
