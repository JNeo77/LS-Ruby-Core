VALID_CHOICES = {r: 'rock', p: 'paper', s: 'scissors', l: 'lizard', sp: 'spock'}
COMPUTER_CHOICES = %w(r p s l sp)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'rock' && second == 'scissors')
end

def results(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

loop do # main loop
  prompt("Let's play Rock Paper Scissors Lizard Spock!")
  prompt("The first player to get 5 wins is the Grand Champion!")

  computer_wins = 0
  player_wins = 0

  until computer_wins == 5 || player_wins == 5 do
    choice = ''
    operator_prompt = <<-MSG
      Choose one. 
      Enter 'r' for rock
      Enter 'p' for paper
      Enter 's' for scissors
      Enter 'l' for lizard
      Enter 'sp' for Spock
    MSG

    prompt(operator_prompt)
    loop do
      choice = VALID_CHOICES[Kernel.gets().chomp().to_sym]
    
      if choice
        break
      else
        prompt("That's not a valid choice")
      end
    end

    computer_choice = VALID_CHOICES[COMPUTER_CHOICES.sample.to_sym]

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

    game_results = results(choice, computer_choice)
    prompt(game_results)

    if game_results == "You won!"
      player_wins += 1
    elsif game_results == "Computer won!"
      computer_wins += 1
    end
  end

  puts player_wins
  puts computer_wins

  grand_champion = player_wins == 5 ? "You are the Grand Champion!" : "The Computer is the Grand Champion!"
  prompt(grand_champion)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")