#
# Overrides of Blacklight helpers in Blacklight::BlacklightHelperBehavior
#
# To implement, create blacklight_helper.rb in app/helpers with this content:
#
# module BlacklightHelper
#   include Blacklight::BlacklightHelperBehavior
#   include FcrepoAdmin::Helpers::BlacklightHelperBehavior
# end
#
module FcrepoAdmin::Helpers
  module BlacklightHelperBehavior

    def link_to_document(doc, opts={:label=>nil, :counter => nil, :results_view => true})
      opts[:label] ||= blacklight_config.index.show_link.to_sym
      label = render_document_index_label doc, opts
      link_to label, fcrepo_admin.object_path(doc.id)
    end

  end
end
