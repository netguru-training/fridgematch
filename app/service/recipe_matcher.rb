class RecipeMatcher
  def initialize user
    @user = user
  end

  def find limit = 10
    sorted_matches.take(limit)
  end

  private

  def sorted_matches
    find_matches.sort_by{ |s| [(s.first.ingredients.count - s.last).to_f / s.last, -s.last] }.map(&:first)
  end

  def find_matches
    blacklisted_recipes = @user.blacklisted_ingredients.flat_map(&:recipes).uniq

    @user.ingredients.each_with_object({}) do |i, match_hash|
      (i.recipes - blacklisted_recipes).each do |r|
        match_hash[r] ||= 0
        match_hash[r] += 1
      end
    end
  end
end
