module Permissions
  extend self

  def string_to_int(string)
    map = {"r" => 4, "w" => 2, "x" => 1, "-" => 0}.freeze

    string.split("").each_slice(3).reduce([]) do |memo, chars|
      result = chars.map { |c| map[c] }.reduce(&:+)
      memo << result
    end.join("")
  end
end
