module Permissions
  extend self

  def string_to_int(string)
    map = {"r" => 4, "w" => 2, "x" => 1, "-" => 0}.freeze
    return unless string.match(/[rwx-]+{9}/)

    string.chars.each_slice(3).reduce([]) do |memo, chars|
      result = chars.map { |c| map[c] }.reduce(&:+)
      memo << result
    end.join("").to_i
  end
end
