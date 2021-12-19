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
            
            action = nil
            
            if verb == 'GET'
                print 'Choose action (index/show) / q to exit: '
                action = gets.chomp
                break if action == 'q'

            end
            
            action.nil? ? routes[verb].call : routes[verb][action].call

        end
    end
end

class PostsController
    
    extend Resource
    
    def initialize
        
        @posts = []
    
    end
  
    def index
        
        i = 1
        if @post.size !=0
            
            for y in @post do

                puts "#{i}, #{y}"
                i+=1

            end
    
        else 

            puts "No posts :/"

        end

    end
  
    def show
        
        puts 'Write the index of the post: '
        id = gets.to_i

        while id < 0 
            puts "Incorrect ID entered, you must enter a natural number."
        end

        puts "#{id}. #{@posts[id-1]}\n"

    end
  
    def create

        puts 'Write the post: '
        write_post = gets.chomp
        !write_post.empty? ? (@posts << write_post) : "The post cannot be empty."
        puts "#{@posts.size}. #{@posts[-1]}"

    end
  
    def update

        puts 'Write the index of the post: '
        id = gets.to_i
        puts 'Write the post: '

        while id < 0
            puts "Incorrect ID entered, you must enter a natural number."
        end

        write_post = gets.chomp
        @posts[id-1] = write_post
        puts "#{id}. #{@posts[id-1]}"

    end
  
    def destroy

        puts 'Write the index of the post: '
        id = gets.to_i

        while id < 0
            puts "Incorrect ID entered, you must enter a natural number."
        end

        @posts.delete_at(id-1)
        puts "Success!\n"

    end

end

class CommentController
    
    extend Resource
  
  
    def initialize

      @comments = []

    end
  
    def index
        
        i = 1
        if @comments.size!=0
            
            for y in @comments do
                puts "#{i}, #{y}"
                i+=1

            end
    
        else 

            puts "No posts :/"

        end

    end
  
    def show
        
        puts 'Write the index of the comment: '
        id = gets.to_i

        while id < 0
            puts "Incorrect ID entered, you must enter a natural number."
        end

        puts "#{id}. #{@comments[id-1]}\n"

    end
  
    def create

        puts 'Write the comment: '
        write_post = gets.chomp
        !write_post.empty? ? (@comments << write_post) : "The post cannot be empty."
        puts "#{@comments.size}. #{@comments[-1]}"

    end
  
    def update

        puts 'Write the index of the comment: '
        id = gets.to_i
        puts 'Write the comment: '

        while id < 0
            puts "Incorrect ID entered, you must enter a natural number."
        end

        write_post = gets.chomp
        @comments[id-1] = write_post
        puts "#{id}. #{@comments[id-1]}"

    end
  
    def destroy

        puts 'Write the index of the comment: '
        id = gets.to_i

        while id < 0
            puts "Incorrect ID entered, you must enter a natural number."
        end

        @comments.delete_at(id-1)
        puts "Success!\n"

    end
end
  
class Router
    
    def initialize

      @routes = {}

    end
  
    def init
        resources(PostsController, 'posts')
        resources(CommentController, 'comments')
        
        loop do

            print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
            choise = gets.chomp
  
            PostsController.connection(@routes['posts']) if choise == '1'
            
            break if choise == 'q'
            
            CommentController.connection(@routes['comments']) if choise == '2'
            break if choise == 'q'
        end
        
        puts 'So good bye...'
    
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
  
#router = Router.new
  
#router.init