module Api
    module V1
        class ProductsController < ApplicationController
            def index
                products = Product.order('id')
                render json: {
                    products: products
                }, status: :ok
            end

            def show
                product = Product.find(params[:id])
                render json: {
                    product: product
                }, status: :ok
            end

            def create
                product = Product.new(product_params)
                if product.save
                    render json: {
                        product: product
                    }, status: :ok
                else
                    render json: {
                        product: product.errors
                    }, status: :unprocessable_entity
                end
            end

            def destroy
                product = Product.find(params[:id])
                if product.destroy
                    render json: {
                        product: product
                    }, status: :ok
                else
                    render json: {
                        product: product.errors
                    }, status: :unprocessable_entity
                end
            end

            def update
                product = Product.find(params[:id])
                if product.update(product_params)
                    render json: {
                        product: product
                    }, status: :ok
                else
                    render json: {
                        product: product.errors
                    }, status: :unprocessable_entity
                end
            end

            private

            def product_params
                params.permit(:name, :description, :sku, :stock, :status, :category_id, :brand_id,)
            end
        end
    end
end