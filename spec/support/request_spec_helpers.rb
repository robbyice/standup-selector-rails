module RequestSpecHelpers
  RSpec::Matchers.define :indiff_hash_match do |expected|
    match do |actual|
      RequestSpecHelpers.indiff_hash_match(actual, expected)
    end
  end

  RSpec::Matchers.define :indiff_array_match do |expected|
    match do |actual|
      actual.length == expected.length &&
          actual.each_with_index.reduce(true) {|matches, (element, index)|
            matches && RequestSpecHelpers.indiff_hash_match(element, expected[index])} == true
    end
  end


  class << self
    def indiff_hash_match(actual, expected)
      actual == expected ||
          actual == expected.with_indifferent_access ||
            actual.with_indifferent_access == expected
    end
  end
end