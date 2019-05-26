require 'colorize'
module Presenters

  MAX_TIME_FOR_RESPONSE = 100
  SECONDS_TO_MILLISECONDS = 1000

  class NecessaryTimePresenter
    class << self

      def show(time)
        time_in_milliseconds = time * SECONDS_TO_MILLISECONDS
        time_in_milliseconds < MAX_TIME_FOR_RESPONSE ? show_success(time_in_milliseconds) : show_error(time_in_milliseconds)
      end

      def show_success(time_in_milliseconds)
        puts "It tooks #{time_in_milliseconds.to_s.green} ms. :)"
      end

      def show_error(time_in_milliseconds)
        puts "It tooks #{time_in_milliseconds.to_s.red} ms. :("
      end
    end
  end
end
