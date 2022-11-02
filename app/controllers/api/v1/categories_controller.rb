module Api
    module V1
        class CategoriesController < ApplicationController
            def index
                categories = Category.order('id')
                render json: {
                    categories: categories
                }, status: :ok
            end

            def show
                category = Category.find(params[:id])
                render json: {
                    category: category
                }, status: :ok
            end

            def create
                category = Category.new(category_params)
                if category.save
                    render json: {
                        category: category
                    }, status: :ok
                else
                    render json: {
                        category: category.errors
                    }, status: :unprocessable_entity
                end
            end

            def destroy
                category = Category.find(params[:id])
                if category.destroy
                    render json: {
                        category: category
                    }, status: :ok
                else
                    render json: {
                        category: category.errors
                    }, status: :unprocessable_entity
                end
            end

            def update
                category = Category.find(params[:id])
                if product.update(category_params)
                    render json: {
                        category: category
                    }, status: :ok
                else
                    render json: {
                        category: category.errors
                    }, status: :unprocessable_entity
                end
            end

            private

            def category_params
                params.permit(:name)
            end
        end
    end
end