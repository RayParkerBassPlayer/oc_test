require "rails_helper"


describe "Shingle Browsing Start State", :vcr do
  let(:shingles) {ShingleConnection.shingles}
  let(:shingle_select_values) {shingles.collect {|shingle| [shingle["proper_name"], shingle["uid"]]}.sort {|l, r| l.first <=> r.first}}
  let(:shingle_names) {shingle_select_values.collect(&:first).sort}
  let(:shingle_values) {shingle_select_values.collect(&:last).sort}
  let(:shingle_dropdown_selector) {"#shingle-names"}

  describe "page start state" do
    it "shows the default shingle name in the dropdown selector" do
      visit root_path

      expect(find(shingle_dropdown_selector).value).to eq shingle_values.first
    end

    it "shows the default shingle large image" do
      visit root_path

      within("#main-image") do
        shingle_color = ShingleConnection.shingle_colors(shingles.first).first["house_thumb_image_url"]

        expect(find("img")["src"]).to eq shingle_color
      end
    end

    it "shows the color swatches with the default shingle selected" do
      visit root_path

      within("#swatches") do
        shingle_color = ShingleConnection.shingle_colors(shingles.first).first["swatch_160x160_url"]

        expect(find("img.selected")["src"]).to eq shingle_color
      end
    end
  end
end
