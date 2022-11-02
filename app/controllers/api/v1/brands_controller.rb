module Api
    module V1
        class BrandsController < ApplicationController
            def index
                brands = Brand.order('id')
                render json: {
                    brands: brands
                }, status: :ok
            end

            def show
                brand = Brand.find(params[:id])
                render json: {
                    brand: brand
                }, status: :ok
            end

            def create
                brand = Brand.new(brand_params)
                if brand.save
                    render json: {
                        brand: brand
                    }, status: :ok
                else
                    render json: {
                        brand: brand.errors
                    }, status: :unprocessable_entity
                end
            end

            def destroy
                brand = Brand.find(params[:id])
                if brand.destroy
                    render json: {
                        brand: brand
                    }, status: :ok
                else
                    render json: {
                        brand: brand.errors
                    }, status: :unprocessable_entity
                end
            end

            def update
                brand = Brand.find(params[:id])
                if brand.update(brand_params)
                    render json: {
                        brand: brand
                    }, status: :ok
                else
                    render json: {
                        brand: brand.errors
                    }, status: :unprocessable_entity
                end
            end

            private

            def brand_params
                params.permit(:name)
            end
        end
    end
end