require 'rails_helper'

module Yoolk
  module Liquid
    describe HTML_TruncatorFilter do
      let(:html) { "เปิดกิจการเมื่อวันที่ 28 กุมภาพันธ์ 2529 ต่อมามีสาขาเพิ่มขึ้นมาอีก 4 สาขา<b> เรามีประสบการณ์มายาวนานในด้านผ้าม่านมา กว่า30ปี </b>ท่านจึงมั่นใจได้ว่าจะได้รับสินค้าและบริการที่มีคุณภาพ ราคายุติธรรม<br><br><b>\"เพียงท่านยกหูโทรศัพท์ เราพร้อมจะรับใช้ท่านทันที\"</b>" }

      it '#html_truncator' do
        expect_template_result("{{ '#{html}' | html_truncator: 70, length_in_chars: true }}", 'เปิดกิจการเมื่อวันที่ 28 กุมภาพันธ์ 2529 ต่อมามีสาขาเพิ่มขึ้นมาอีก 4…')
      end
    end
  end
end