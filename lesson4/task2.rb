# Реализовать логику для PostController

# В отчете расписать понимание работы класса Router и причины,
# по которым используется extend для модуля Resource

# В случае неправильного ввода выводится соответствующее сообщение об ошибке
# с вариантами ее исправления.

module Resource
    def connection(routes)
      if routes.nil?
        puts "No route matches for #{self}"
        return
      end
  
      loop do
        print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
        verb = gets.chomp
        break if verb == 'q'
        if verb != "GET" && verb != "POST" && verb != "PUT" && verb != "DELETE"
            puts 'Можно ввести только 4 команды: GET, POST, PUT и q'
            break
        end
        action = nil
  
        if verb == 'GET'
            print 'Choose action (index/show) / q to exit: '
            action = gets.chomp
            break if action == 'q'
            if action != "index" && action != "show" && action != "q"
                puts 'Можно ввести только 3 команды: index, show и q'
                break
            end
        end
  
  
        action.nil? ? routes[verb].call : routes[verb][action].call
      end
    end
  end
  
  class PostsController
    extend Resource
  
    def initialize
      @posts = ["tsk1", "tsk2"]
    end
  
    def index
        ind = 0
        while ind < @posts.size
            puts "#{ind}. #{@posts[ind]}\n"
            ind += 1
        end
        puts "\n"  
    end
  
    def show
        puts 'Введите индекс поста'
        ind = gets.to_i
        puts "#{ind}. #{@posts[ind]}\n\n"
    end
  
    def create
        puts 'Введите текст для нового поста'
        txt = gets.to_s
        @posts.push(txt)
        puts "#{@posts.size-1}. #{@posts[-1]}\n\n"
    end
  
    def update
        puts 'Введите индекс и текст поста для замены'
        ind = gets.to_i
        txt = gets.to_s
        @posts[ind] = txt
        index  
    end
  
    def destroy
        puts 'Введите индекс для удаления поста'
        ind = gets.to_i
        @posts.delete_at(ind)
        index
    end
  end
  
  class Router
    def initialize
      @routes = {}
    end
  
    def init
      resources(PostsController, 'posts')
  
      loop do
        print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
        choise = gets.chomp
  
        PostsController.connection(@routes['posts']) if choise == '1'
        break if choise == 'q'
        if choise != 1 && choise != 2 && choise != "q"
            puts 'Необходимо ввести 1, 2 или q для выхода'
        end
      end
  
      puts 'Good bye!'
    end
  
    def resources(klass, keyword)
      controller = klass.new
      @routes[keyword] = {
        'GET' => {
          'index' => controller.method(:index),
          'show' => controller.method(:show)
        },
        'POST' => controller.method(:create),
        'PUT' => controller.method(:update),
        'DELETE' => controller.method(:destroy)
      }
    end
  end
  
  router = Router.new
  
  router.init