PuppetLint.new_check(:file_line_match) do
  def check

    resource_indexes.each do |resource|
      if resource[:type].value == "file_line"
        matches = resource[:param_tokens].select { |param_token|
          param_token.value == 'match'
        }
        line = resource[:param_tokens].select { |param_token|
          param_token.value == 'line'
        }

        unless matches.length == 1
          tkn = resource[:tokens].first
          notify :warning, {
              :message => 'expected one match attribute for file_line resource',
              :line    => tkn.line,
              :column  => tkn.column,
          }
        else
          match_value_token = matches.first.next_code_token.next_code_token
          line_value_token = line.first.next_code_token.next_code_token

          reg = Regexp::new match_value_token.value
          unless reg.match line_value_token.value
            tkn = resource[:tokens].first
            notify :warning, {
                :message => 'match attribute for file_line doesn\'t match line',
                :line    => tkn.line,
                :column  => tkn.column,
            }
          end

        end
      end
    end
  end
end