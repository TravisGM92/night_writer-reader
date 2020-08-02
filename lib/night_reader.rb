require './lib/night_writer'

class NightReader < NightWriter

  def braille_to_english
    array = []
    message = @reader.read(@input_file).chomp.split("\n").map{ |ele| ele.split(" ")}
    separated_braille = message.transpose
    separated_braille.each do |ele|
      @braille.encoding.each do |char, braille|
        if ele[0] == braille[0] && ele[1] == braille[1] && ele[2] == braille[2]
          array << char
        end
      end
    end
    array.join
  end

  def encode_to_english_file
    english_message = self.braille_to_english
    File.open(@output_file, 'w+') do |file|
      file.write english_message
      file.close
    end
    @reader.read(@input_file)
  end

  def created_message_file_script
    "Created '#{@output_file}' containing #{@reader.read(@output_file).length} characters"
  end
end

# night_reader = NightReader.new
# night_reader.encode_to_english_file
# p night_reader.created_message_file_script
