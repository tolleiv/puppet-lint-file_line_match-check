PuppetLint.new_check(:file_line_match) do
  def check

    resource_indexes.each do |resource|
      if resource[:type].value == "file_line"
        matches = resource[:param_tokens].select { |param_token|
          param_token.value == 'match'
        }
        unless matches.length == 1
          tkn = resource[:tokens].first
          notify :warning, {
              :message => 'expected one match attribute for file_line resource',
              :line    => tkn.line,
              :column  => tkn.column,
          }
        end
      end
    end
  end
end