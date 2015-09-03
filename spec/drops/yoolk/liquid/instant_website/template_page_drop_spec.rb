require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::TemplatePageDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:display_order) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }

      it { should delegate(:home?).to(:object) }
      it { should delegate(:products?).to(:object) }
      it { should delegate(:services?).to(:object) }
      it { should delegate(:menu?).to(:object) }
      it { should delegate(:photos?).to(:object) }
      it { should delegate(:about_us?).to(:object) }
      it { should delegate(:contact_us?).to(:object) }
      it { should delegate(:reservation?).to(:object) }
      it { should delegate(:feedback?).to(:object) }
      it { should delegate(:announcements?).to(:object) }
      it { should delegate(:videos?).to(:object) }
      it { should delegate(:attachments?).to(:object) }
      it { should delegate(:links?).to(:object) }
      it { should delegate(:people?).to(:object) }
      it { should delegate(:map?).to(:object) }
      it { should delegate(:brochures?).to(:object) }
    end
  end
end
