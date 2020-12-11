module Lita
  module Handlers
    class Doubler < Handler
      # insert handler code here
      route(
        /^double\s+(\d+)$/i,
        :respond_with_double,
        command: true,
        help: {'double N' => 'prints N + N'}
      )

      route(
        /^square\s+(\d+)$/i,
        :respond_with_square,
        command: true,
        help: {'square N' => 'prints N * N'}
      )

      route(
        /^square\s+(\d+)$/i,
        :respond_with_greet,
        command: true,
        help: {'square N' => 'prints N * N'}
      )

      def respond_with_double(response)
        # read up on the ruby matchdata class for more options
        n = response.match_data.captures.first
        n = Integer(n)

        response.reply "#{n} + #{n} = #{double_number n}"
      end

      def respond_with_square(response)
        # read up on the ruby matchdata class for more options
        n = response.match_data.captures.first
        n = Integer(n)

        response.reply "#{n} * #{n} = #{square_number n}"
      end

      def respond_with_greet(response)
        # read up on the ruby matchdata class for more options
        n = response.match_data.captures.first
        n = Integer(n)
        response.reply "#{greet n}"
      end

      def double_number(n)
        n + n
      end

      def square_number(n)
        n * n
      end

      def greet(str)
        'Hi, my name is Noor'
      end

      Lita.register_handler(self)
    end
  end
end
