require './test/test_helper.rb'

class NightReaderTest < MiniTest::Test

  def test_it_exists
    # skip
    night_reader = NightReader.new

    assert_instance_of NightReader, night_reader
  end

  def test_it_can_inherit_from_night_writer
    # skip
    ARGV.replace(['test_file_for_script.txt', 'test.txt'])

    @reader = FileReader.new
    night_reader = NightReader.new
    expected = "Created 'test.txt' containing 48 characters"
    assert_equal expected, night_reader.created_message_file_script
  end

  def test_it_can_read_test_file_of_braille
    # skip
    ARGV.replace(['input.txt', 'test.txt'])

    @reader = FileReader.new
    expected = "0. \n" + "..\n" + "..\n"
    assert_equal expected, @reader.read('test_file_for_braille.txt')
  end

  def test_it_can_take_braille_letters_and_change_back_to_english
    # skip
    ARGV.replace(['test_file_for_braille.txt', 'input.txt'])

    @reader = FileReader.new
    night_reader = NightReader.new

    assert_equal "a", night_reader.braille_to_english
  end

  def test_it_can_translate_words_of_braille_into_english
    # skip
    ARGV.replace(['test_file_to_translate_braille_words.txt', 'input.txt'])

    @reader = FileReader.new
    night_reader = NightReader.new

    assert_equal "abc v", night_reader.braille_to_english
  end

  def test_it_can_translate_words_of_braille_into_english_with_file
    # skip
    ARGV.replace(['test_file_to_translate_braille_words.txt', 'input.txt'])

    @reader = FileReader.new
    night_reader = NightReader.new
    expected = "0. 0. 00 .. 0.\n" + ".. 0. .. .. 0.\n" + ".. .. .. .. 00\n"

    assert_equal expected, night_reader.encode_to_english_file
  end

  def test_it_can_translate_words_of_braille_into_english2
    # skip
    ARGV.replace(['capital_braille_test.txt'])

    @reader = FileReader.new
    night_reader = NightReader.new

    assert_equal "Aa v", night_reader.braille_to_english
  end
end
