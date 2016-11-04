require 'minitest/autorun'
require 'debride_slim'
require 'tempfile'

module TestDebride; end

class TestDebride::TestSlim < Minitest::Test
  def test_process_slim
    file = Tempfile.new ['debride-slim-test', '.slim']

    file.write(<<-SLIM.strip)
p
= 1/0
- "foo"
    SLIM

    file.flush

    sexp = Debride.new.process_slim file.path

    # Output from Slim 3.0.7
    expected = s(:block, s(:lasgn, :_buf, s(:array)), s(:call, s(:lvar, :_buf), :<<, s(:call, s(:str, '<p></p>'), :freeze)), s(:call, s(:lvar, :_buf), :<<, s(:call, s(:colon2, s(:colon3, :Temple), :Utils), :escape_html, s(:call, s(:lit, 1), :/, s(:lit, 0)))), s(:str, 'foo'), s(:lasgn, :_buf, s(:call, s(:lvar, :_buf), :join, s(:call, s(:str, ''), :freeze)))) # rubocop:disable Metrics/LineLength

    assert_equal expected, sexp
  end
end
