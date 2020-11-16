# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                             combineds GET    /combineds(.:format)                                                                     combineds#index
#                                       POST   /combineds(.:format)                                                                     combineds#create
#                          new_combined GET    /combineds/new(.:format)                                                                 combineds#new
#                         edit_combined GET    /combineds/:id/edit(.:format)                                                            combineds#edit
#                              combined GET    /combineds/:id(.:format)                                                                 combineds#show
#                                       PATCH  /combineds/:id(.:format)                                                                 combineds#update
#                                       PUT    /combineds/:id(.:format)                                                                 combineds#update
#                                       DELETE /combineds/:id(.:format)                                                                 combineds#destroy
#                recipe_processed_items GET    /recipe_processed_items(.:format)                                                        recipe_processed_items#index
#                                       POST   /recipe_processed_items(.:format)                                                        recipe_processed_items#create
#             new_recipe_processed_item GET    /recipe_processed_items/new(.:format)                                                    recipe_processed_items#new
#            edit_recipe_processed_item GET    /recipe_processed_items/:id/edit(.:format)                                               recipe_processed_items#edit
#                 recipe_processed_item GET    /recipe_processed_items/:id(.:format)                                                    recipe_processed_items#show
#                                       PATCH  /recipe_processed_items/:id(.:format)                                                    recipe_processed_items#update
#                                       PUT    /recipe_processed_items/:id(.:format)                                                    recipe_processed_items#update
#                                       DELETE /recipe_processed_items/:id(.:format)                                                    recipe_processed_items#destroy
#                       processed_items GET    /processed_items(.:format)                                                               processed_items#index
#                                       POST   /processed_items(.:format)                                                               processed_items#create
#                    new_processed_item GET    /processed_items/new(.:format)                                                           processed_items#new
#                   edit_processed_item GET    /processed_items/:id/edit(.:format)                                                      processed_items#edit
#                        processed_item GET    /processed_items/:id(.:format)                                                           processed_items#show
#                                       PATCH  /processed_items/:id(.:format)                                                           processed_items#update
#                                       PUT    /processed_items/:id(.:format)                                                           processed_items#update
#                                       DELETE /processed_items/:id(.:format)                                                           processed_items#destroy
#                                 sales GET    /sales(.:format)                                                                         sales#index
#                                       POST   /sales(.:format)                                                                         sales#create
#                              new_sale GET    /sales/new(.:format)                                                                     sales#new
#                             edit_sale GET    /sales/:id/edit(.:format)                                                                sales#edit
#                                  sale GET    /sales/:id(.:format)                                                                     sales#show
#                                       PATCH  /sales/:id(.:format)                                                                     sales#update
#                                       PUT    /sales/:id(.:format)                                                                     sales#update
#                                       DELETE /sales/:id(.:format)                                                                     sales#destroy
#                   recipe_recipe_items GET    /recipes/:recipe_id/recipe_items(.:format)                                               recipe_items#index
#                                       POST   /recipes/:recipe_id/recipe_items(.:format)                                               recipe_items#create
#                new_recipe_recipe_item GET    /recipes/:recipe_id/recipe_items/new(.:format)                                           recipe_items#new
#               edit_recipe_recipe_item GET    /recipes/:recipe_id/recipe_items/:id/edit(.:format)                                      recipe_items#edit
#                    recipe_recipe_item GET    /recipes/:recipe_id/recipe_items/:id(.:format)                                           recipe_items#show
#                                       PATCH  /recipes/:recipe_id/recipe_items/:id(.:format)                                           recipe_items#update
#                                       PUT    /recipes/:recipe_id/recipe_items/:id(.:format)                                           recipe_items#update
#                                       DELETE /recipes/:recipe_id/recipe_items/:id(.:format)                                           recipe_items#destroy
#         recipe_recipe_processed_items GET    /recipes/:recipe_id/recipe_processed_items(.:format)                                     recipe_processed_items#index
#                                       POST   /recipes/:recipe_id/recipe_processed_items(.:format)                                     recipe_processed_items#create
#      new_recipe_recipe_processed_item GET    /recipes/:recipe_id/recipe_processed_items/new(.:format)                                 recipe_processed_items#new
#     edit_recipe_recipe_processed_item GET    /recipes/:recipe_id/recipe_processed_items/:id/edit(.:format)                            recipe_processed_items#edit
#          recipe_recipe_processed_item GET    /recipes/:recipe_id/recipe_processed_items/:id(.:format)                                 recipe_processed_items#show
#                                       PATCH  /recipes/:recipe_id/recipe_processed_items/:id(.:format)                                 recipe_processed_items#update
#                                       PUT    /recipes/:recipe_id/recipe_processed_items/:id(.:format)                                 recipe_processed_items#update
#                                       DELETE /recipes/:recipe_id/recipe_processed_items/:id(.:format)                                 recipe_processed_items#destroy
#                               recipes GET    /recipes(.:format)                                                                       recipes#index
#                                       POST   /recipes(.:format)                                                                       recipes#create
#                            new_recipe GET    /recipes/new(.:format)                                                                   recipes#new
#                           edit_recipe GET    /recipes/:id/edit(.:format)                                                              recipes#edit
#                                recipe GET    /recipes/:id(.:format)                                                                   recipes#show
#                                       PATCH  /recipes/:id(.:format)                                                                   recipes#update
#                                       PUT    /recipes/:id(.:format)                                                                   recipes#update
#                                       DELETE /recipes/:id(.:format)                                                                   recipes#destroy
#                              receipts GET    /receipts(.:format)                                                                      receipts#index
#                                       POST   /receipts(.:format)                                                                      receipts#create
#                           new_receipt GET    /receipts/new(.:format)                                                                  receipts#new
#                          edit_receipt GET    /receipts/:id/edit(.:format)                                                             receipts#edit
#                               receipt GET    /receipts/:id(.:format)                                                                  receipts#show
#                                       PATCH  /receipts/:id(.:format)                                                                  receipts#update
#                                       PUT    /receipts/:id(.:format)                                                                  receipts#update
#                                       DELETE /receipts/:id(.:format)                                                                  receipts#destroy
#                         kitchen_items GET    /kitchen_items(.:format)                                                                 kitchen_items#index
#                                       POST   /kitchen_items(.:format)                                                                 kitchen_items#create
#                      new_kitchen_item GET    /kitchen_items/new(.:format)                                                             kitchen_items#new
#                     edit_kitchen_item GET    /kitchen_items/:id/edit(.:format)                                                        kitchen_items#edit
#                          kitchen_item GET    /kitchen_items/:id(.:format)                                                             kitchen_items#show
#                                       PATCH  /kitchen_items/:id(.:format)                                                             kitchen_items#update
#                                       PUT    /kitchen_items/:id(.:format)                                                             kitchen_items#update
#                                       DELETE /kitchen_items/:id(.:format)                                                             kitchen_items#destroy
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  resources :combineds
  resources :recipe_processed_items
  resources :processed_items
  resources :sales
  resources :recipes do
    resources :recipe_items
    resources :recipe_processed_items
  end
  resources :receipts
  resources :kitchen_items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
