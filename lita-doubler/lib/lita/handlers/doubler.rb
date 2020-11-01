module Lita
  module Handlers
    class Doubler < Handler
      route(
        /^double\s+(\d+)$/i,
        :respond_with_double,
        command: true,

        help: {'double n' => 'prints n + n',
              'square n' => 'prints n * n',
            }
          )

      route(
        /^square\s+(\d+)$/i,
        :respond_with_square,
        command: true,
      )

      def respond_with_double(response)
        n = response.match_data.captures.first
        n = Integer(n)
      
        response.reply "#{n} + #{n} = #{double_number n}"
      end
      
      def respond_with_square(response)
        n = response.match_data.captures.first
        n = Integer(n)
      
        response.reply "#{n} * #{n} = #{square_number n}"
      end

      def double_number(n)
        n + n
      end

      def square_number(n)
         n * n
      end

      Lita.register_handler(self)
    end
  end
end
