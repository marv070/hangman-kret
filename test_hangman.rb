require "minitest/autorun"
require_relative "hangman.rb"

class Testhangmanfunctions <Minitest::Test
	def test_class_returns_upcase_word
	hangman = Hangman.new("PRESLEE")
	assert_equal("PRESLEE",hangman.name)
	end
	def test_class_returns_name
		hangman = Hangman.new("CAROL")
		assert_equal(5,hangman.name_count)
	end
	def test_class_user_guess_is_pushed_into_guess_array1
		hangman = Hangman.new("KRETZER")
		letter = "P"
		assert_equal(["P"],hangman.update_guessed(letter))
	end
	def test_class_user_guess_is_pushed_into_guess_array2
		hangman = Hangman.new("KRETZER")
		hangman.guessed = ["N","Y","O"]
		letter = "I"
		assert_equal(["N","Y","O","I"],hangman.update_guessed(letter))
	end
	def test_class_if_guess_already_in_array_returns_false3
		hangman = Hangman.new("KRETZER")
		hangman.guessed = ["N","G","H","L"]
		letter = "E"
		assert_equal(["N","G","H","L","E"],hangman.update_guessed(letter))
	end
	def test_class_returns_five_blanks1
		hangman = Hangman.new("CAROL")
		assert_equal(["_","_","_","_","_"],hangman.blank)
	end
	def test_class_returns_if_included_in_password
		hangman = Hangman.new("WOLF")
		letter = "O"
		assert_equal(true,hangman.correct_letter?(letter))
	end
	def test_returns_correct_index_positions2
		hangman = Hangman.new("CAROL")
		letter = "C"
		hangman.correct_index(letter)
		assert_equal(["C","_","_","_","_"],hangman.correct_blank)
	end
	def test_returns_correct_index_positions3
		hangman = Hangman.new("CAROL")
		hangman.correct_blank = ["C","_","_","_","_"]
		letter = "O"
		hangman.correct_index(letter)
		assert_equal(["C","_","_","O","_"],hangman.correct_blank)
	end
	def correct_blank_array_stays_the_same_after_invalid_guess1
		hangman = Hangman.new("HANGMAN")
		letter = "P"
		hangman.correct_index(letter)
		assert_equal(["_","_","_","_","_","_","_"],hangman.correct_blank)
	end
	def correct_blank_array_stays_the_same_after_invalid_guess2
		hangman = Hangman.new("HANGMAN")
		letter = "H"
		hangman.correct_index(letter)
		assert_equal(["H","_","_","_","_","_","_"],hangman.correct_blank)
	end
	def test_class_see_if_guess_has_been_guessed
		hangman = Hangman.new("PRESLEE")
		hangman.guessed = ["S","P","W"]
		letter = "P"
		assert_equal(true,hangman.available_guessed(letter))
	end
	def test_see_if_guess_is_guessed
		hangman = Hangman.new("HANGMNA")
		hangman.guessed = ["O","Y","K"]
		letter = "Y"
		assert_equal(false,hanman.available_guessed(letter))
	end
	def test_see_if_guess_is_guessed
		hangman = Hangman.new("HANGMAN")
		hangman.guessed = ["O","H","K"]
		letter = "G"
		assert_equal(true,hanman.available_guessed(letter))
	end
	# def test_correct_blank_array_stays_same_for_invalid_guess1
	# 	hangman = Hangman.new("PRESLEE")
	# 	letter = "R"
	# 	hangman.correct_index(letter)
	# 	assert_equal(["_","R","_","_","_","_","_"],hangman.correct_blank)
	# end
	# def test_correct_blank_array_stays_the_same_after_invaild_guess2
	# 	hangman = Hangman.new("HANGMAN")
	# 	letter = "H"
	# 	hangman.correct_index(["H","_","_","_","_","_","_"],hangman.correct_blank)
	# end
	# def test_class_if_guess_already_in_array_or_not_returns_false
	# 	hangman = Hangman.new("PRESLEE")
	# 	hangman.guessed =["W","T"."J"]
	# 	letter = "T"
	# 	assert_equal(false,hangman.available_guessed(letter))
	# end
	# def test_class_if_guess_has_been_guessed
	# 	hangman = Hangman.new("PAUL")
	# 	hangman.guessed = ["P","C","O"]
	# 	letter = "P"
	# 	assert_equal(true, hangman.available_guessed(letter))
	end
	# def test_valid_letter
	# 	hangman = Hangman.new("PRESLEE")
	# 	hangman.guessed
end
