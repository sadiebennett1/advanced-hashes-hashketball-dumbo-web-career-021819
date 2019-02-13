# Write your code here!
require 'pry'
def game_hash
  game = {:home => {:team_name => "Brooklyn Nets", :colors => ["Black","White"],
          :players => {"Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
          "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
          "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
          "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
          "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}}},
          :away => {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"],
          :players => {"Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
          "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
          "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
          "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
          "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}}}}
end

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stat|
          if player == name
            stat.each do |title, num|
              if title == :points
                return num
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stat|
          if player == name
            stat.each do |title, num|
              if title == :shoe
                return num
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name && data == team_name
        team_data.each do |attribute, data|
          if attribute == :colors
            # binding.pry
            return data
          end
        end
      end
    end
  end
end

def team_names
  arr = []
  game_hash.each do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :team_name
        arr << data
      end
    end
  end
  arr
end

def player_numbers(team)
  arr = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name && data == team
        team_data.each do |attribute, data|
          if attribute == :players
            data.each do |player, stat|
              stat.each do |title, num|
                if title == :number
                  arr << num
                end
              end
            end
          end
        end
      end
    end
  end
  arr
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stat|
          if player == name
            return stat
          end
        end
      end
    end
  end
end

def rebounds(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stat|
          if player == name
            stat.each do |title, num|
              if title == :rebounds
                return num
              end
            end
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  shoe_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stat|
            stat.each do |title, num|
              if title == :shoe
                shoe_hash[player] = num
              end
            end
          end
        end
      end
    end
    nums_arr = shoe_hash.values
    nums_arr = nums_arr.sort
    num = nums_arr[-1]
    name = shoe_hash.key(num)
    return rebounds(name)
end

def most_points_scored
  points_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stat|
            stat.each do |title, num|
              if title == :points
                points_hash[player] = num
              end
            end
          end
        end
      end
    end
    nums_arr = points_hash.values
    nums_arr = nums_arr.sort
    num = nums_arr[-1]
    name = points_hash.key(num)
    return name
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stat|
            stat.each do |title, num|
              if title == :points
                if location == :home
                  home_points += num
                elsif location == :away
                  away_points += num
                else
                  return nil
                end
              end
            end
          end
        end
      end
    end
  if home_points > away_points
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  names_arr = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
          if attribute == :players
            data.each do |player, stat|
                  names_arr << player
            end
          end
     end
  end
  i = 0
  name = ""
  while i < (names_arr.length - 1)
    name1 = names_arr[i]
    name2 = names_arr[i + 1]
    if name1.length > name2.length
      name = name1
    else
      name = name2
    end
    i += 1
  end
  return name
end

def long_name_steals_a_ton?
  steals_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stat|
            stat.each do |title, num|
              if title == :steals
                steals_hash[player] = num
              end
            end
          end
        end
      end
    end
    nums_arr = steals_hash.values
    nums_arr = nums_arr.sort
    num = nums_arr[-1]
    steal_name = steals_hash.key(num)
    if player_with_longest_name == steal_name
      return true
    else
      return false
    end
end
