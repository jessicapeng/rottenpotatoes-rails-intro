class Movie < ActiveRecord::Base
  def self.all_ratings
    return ['G', 'PG', 'PG-13', 'R', 'NC-17'] 
  end 
  
  def self.sorted_movies(sort_type, ratings)
    if sort_type == "title"
      return self.with_ratings(ratings).order(:title)
    elsif sort_type == "date"
      return self.with_ratings(ratings).order(:release_date)

    end
  end
  
  def self.with_ratings(ratings_list)
  # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
  #  movies with those ratings
  # if ratings_list is nil, retrieve ALL movies
    if ratings_list == nil
      return self.all_ratings
    else 
      return self.where(rating: ratings_list)
    end  
  end
    
  
end


