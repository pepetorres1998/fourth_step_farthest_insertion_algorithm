require 'csv'
require 'pry'

def main
  distances = CSV.read("./distances.csv")
  tour = [1, 5, 1]
  k = 4
  where_to_insert = fourth_step(k, tour, distances)
  puts "Se inserta entre el nodo #{where_to_insert[0]}, y el nodo #{where_to_insert[1]}"
end

def fourth_step(k, tour, distances)
  paths = tour.map.with_index { |node, index|
    [tour[index], tour[index+1]] unless index == tour.length - 1
  }[0..-2]

  paths_delta_f = paths.map { |path|
    distances[path[0] - 1][k - 1].to_i + distances[k - 1][path[1] - 1].to_i - distances[path[0] - 1][path[1] - 1].to_i
  }

  index_of_maximum_distance = paths_delta_f.find_index(paths_delta_f.min)

  paths[index_of_maximum_distance]
end

main
