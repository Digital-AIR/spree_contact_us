module Spree
  module Api
    module V2
      module Storefront
        class ContactsController < ::Spree::Api::V2::BaseController
          include Spree::BaseHelper
          include Spree::Api::V2::CollectionOptionsHelpers
          helper 'spree/products'

          def create
            @contact = Spree::ContactUs::Contact.new(params[:contact])

            if @contact.save
              if Spree::ContactUs::Config.contact_tracking_message.present?
                flash[:contact_tracking] = Spree::ContactUs::Config.contact_tracking_message
              end
              render_serialized_payload { {notice: Spree.t('spree_contact_us.notices.success')}  }
            else
              render_error_payload(@contact.errors.full_messages.to_sentence)
            end
          end

        end
      end
    end
  end
end