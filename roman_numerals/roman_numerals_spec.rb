class Fixnum
  ROMAN_NUMERAL_MAP = {
  1000 => ["M", 100],
   500 => ["D", 100],
   100 => ["C", 10],
    50 => ["L", 10],
    10 => ["X", 10],
     5 => ["V",  1],
     1 => ["I",  1]
  }

  def to_roman
    remainder = self
    roman = ""
    last_value = 1000000
    last_numeral = nil

    ROMAN_NUMERAL_MAP.each do |value, (numeral, subtractor)|
      if remainder + subtractor >= last_value
        roman << ROMAN_NUMERAL_MAP[subtractor].first << last_numeral
        remainder -= (last_value - subtractor)
      else
        factor = remainder / value
        roman << (numeral * factor)
        remainder = remainder % value
      end

      last_value, last_numeral = value, numeral
    end

    roman
  end
end

describe "Roman Numerals" do
  {
    1 => "I",
    2 => "II",
    4 => "IV",
    5 => "V",
    6 => "VI",
    8 => "VIII",
    9 => "IX",
    10 => "X",
    14 => "XIV",
    40 => "XL",
    50 => "L",
    77 => "LXXVII",
    99  => "XCIX",
    100 => "C",
    500 => "D",
    1000 => "M",
    1982 => "MCMLXXXII",
    3937 => "MMMCMXXXVII"
  }.each do |arabic, roman|
    it "converts #{arabic} to #{roman}" do
      arabic.to_roman.should eq(roman)
    end
  end
end
