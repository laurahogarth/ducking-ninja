class Filler
  def initialize
    @sentences = IO.readlines(File.expand_path("lib/generators/test_data/filler_text.txt")) 
  end

  def generate_content(len = 25)
    filler_text = ""
    (rand(len)+1).times do
      filler_text << @sentences.shuffle.first + " "
    end
    return filler_text
  end
end
