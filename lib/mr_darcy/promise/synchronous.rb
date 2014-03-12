module MrDarcy
  module Promise
    class Synchronous < Base

      def result
        value
      end

      def final
        self
      end

      private

      def schedule_promise
        yield
      end

      def generate_child_promise
        ChildPromise.new driver: :synchronous
      end
    end
  end
end