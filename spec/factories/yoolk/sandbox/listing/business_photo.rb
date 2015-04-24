FactoryGirl.define do
  factory :business_photos, class: Yoolk::Sandbox::Listing::BusinessPhoto do
    name         'google business photo'
    embed_script "<iframe height='250' frameborder='0' width='630' scrolling='no' src='https://maps.google.com/maps?q=&amp;layer=c&amp;sll=33.533085,-117.776074&amp;cid=4215633868679829652&amp;panoid=Ecx4lyIFvPT6cIjaiKvgdA&amp;cbp=13,137.23,,0,2.94&amp;gl=US&amp;hl=en&amp;ie=UTF8&amp;hq=&amp;hnear=&amp;ll=33.533085,-117.776074&amp;spn=0.006295,0.006295&amp;t=m&amp;cbll=33.533213,-117.776073&amp;source=embed&amp;output=svembed' marginwidth='0' marginheight='0'></iframe>"
  end
end