require "ripper"
require "proc_source/version"

class Proc
  def proc_source
    return @source if @source
    filepath, start_pos = source_location

    code = File.readlines(filepath)[(start_pos-1)..-1].join
    tokens = Ripper.lex(code).drop_while do |t|
      !proc_token?(t)
    end

    @source = " " * tokens[0][0][1].to_i

    while token = tokens.shift
      @source += token[2]
      break if valid_proc_source?(@source)
    end

    @source
  end

  private

  def proc_token?(token)
    _pos, event, ident = *token
    return true if event == :on_const && ident == "Proc"
    return true if event == :on_ident && ident == "lambda"
    return true if event == :on_ident && ident == "proc"
    return true if event == :on_kw && ident == "do"
    return true if event == :on_lbrace
    return true if event == :on_tlambda
    false
  end

  def valid_proc_source?(source)
    source = "Proc.new " + source if source =~ /\A\s*(do|{)/
    eval(source).instance_of?(Proc)
  rescue SyntaxError, ArgumentError
    false
  end
end
