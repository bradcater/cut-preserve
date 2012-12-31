require 'test/unit'
extend Test::Unit::Assertions

TESTS = [
  [%{echo "a,b,c" | cut -d"," -f1,2,3}, %{a,b,c}],
  [%{echo "a,b,c" | cut -d"," -f2,3,1}, %{a,b,c}],
  [%{echo "a,b,c" | cut -d"," -f1,2,3 -p}, %{a,b,c}],
  [%{echo "a,b,c" | cut -d"," -f2,3,1 -p}, %{b,c,a}]
]

def run_and_assert(inp, outp)
  r = `#{inp}`.strip
  assert_equal(r, outp)
end

TESTS.each do |(inp, outp)|
  run_and_assert(inp, outp)
end
