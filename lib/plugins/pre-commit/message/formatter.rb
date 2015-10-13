module PreCommit
  module Message
    ##
    # Responsible for format a given output
    class Formatter
      ##
      # Format output for a given +errors+ details
      #
      # @param [Hash] JSON errors details
      # @return [String] formatted output (may return nil)
      # @raise ArgumentError when input is empty
      #
      def format(checkstyle)
        throw ArgumentError.new if checkstyle.nil?
        return nil if checkstyle.good?

        format_multiple(checkstyle.bad_files)
      end

      private

      def format_multiple(files)
        files.reduce('') { |a, e| a + format_single(e) }
      end

      def format_single(bad_file)
        "File errors: #{bad_file.name} \n" + format_errors(bad_file.errors)
      end

      def format_errors(errors)
        errors.reduce('') do |out, error|
          out + line(error)
        end
      end

      def line(error)
        "  line: #{error['line']}:#{error['column']}"\
          " error: #{error['message']}\n"
      end
    end
  end
end
