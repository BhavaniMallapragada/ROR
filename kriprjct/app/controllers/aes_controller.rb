
    class AesController < ApplicationController
      def index

        aes = Ae.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded ', data:aes},status: :ok
      end
      def show
        ae = Ae.find(params[:id])
        render json: {status: 'SUCCESS',message:'Loaded banana', data:ae},status: :ok
      end


      def create
        ae = Ae.new(article_params)
        if ae.save
          render json: {status: 'SUCCESS',message:'Saved banana', data:ae},status: :ok
        else

          render json: {status: 'Error',message:' article not saved', data:ae.errors},status: :unprocessable_entity
        end

      end

      def destroy
        ae = Ae.find(params[:id])
        ae.destroy
        render json: {status: 'SUCCESS',message:'delete banana', data:ae},status: :ok

      end

      def update
        ae= Ae.find(params[:id])
        if ae.update_attributes(ae_params)
           render json: {status: 'SUCCESS',message:'update article', data:ae},status: :ok
        else
           render json: {status: 'Error',message:' article not updated', data:ae.errors},status: :unprocessable_entity
        end
      end

      private
      def article_params
        params.permit(:PATIENT_ID, :SITE_NAME, :COUNTRY_NAME, :DELAY_DAYS)
      end
    end
