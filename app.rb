require 'sinatra'
require_relative "hangman.rb"
enable :sessions

get '/' do 
	erb :index
end

post '/player_names' do
	session[:player1] = params[:player1]
	session[:player2] = params[:player2]
	redirect '/password' 
end

get '/password' do 
	erb :password, layout: :password, locals: {p1_name: session[:player1], p2_name: session[:player2]}
end
	post '/secretpassword' do
		password = params[:word]
		session[:game]=Hangman.new(password)
		redirect '/guessing'
	end 
	get '/guessing' do
		erb :guessing, locals:{p1_name: session[:player1], p2_name: session[:player2], blank: session[:game].correct_blank,array: session[:game].guessed,message:"Pick a letter",
			message2: "",counter: session[:game].counter}
	end
post '/guess' do
		choice = params[:letter].upcase
		if session[:game].available_guessed(choice) == true
			 session[:game].update_guessed(choice)
			 session[:game].make_move(choice)
			    if session[:game].winner == true
				redirect '/victory'
			elsif 
				session[:game].failure == true
				redirect '/failure'
			end
			redirect '/guessing'
		else
			erb :guessing, locals:{p1_name: session[:player1], p2_name: session[:player2],blank: session[:game].correct_blank,array: session[:game].guessed,message2:"guess again",
			message: "",counter: session[:game].counter}
		end

end
get '/failure' do
	erb :loser, locals: {p1_name:session[:player1],p2_name: session[:player2],word: session[:game].name}
end
get '/victory' do
	erb :victory, locals: {p1_name: session[:player1], p2_name: session[:player2], word: session[:game].name}

end
