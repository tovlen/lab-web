require 'rspec'
require_relative 'lab4_1.rb'

RSpec.describe "lab4_1" do
    
    context "Router" do
        subject{PostsController.new}
        context "Posts" do
            
            it '#create' do
            
                allow_any_instance_of(PostsController).to receive(:gets).and_return("First post, good job!")
                expect{subject.create}.to output("Write the post: \n1. First post, good job!\n").to_stdout
        
            end
    
        end
        
        it '#show'do

            allow_any_instance_of(PostsController).to receive(:gets).and_return("First post!","1")
            expect(subject.create)
            expect{subject.show}.to output("Write the index of the post: \n1. First post!\n").to_stdout

        end

        it '#index' do

            allow_any_instance_of(PostsController).to receive(:gets).and_return("First post!","Second post")
            expect(subject.create)
            expect(subject.create)
            expect{subject.index}.to output("1. First post!\n2. Second post\n").to_stdout

        end

        it '#update' do

            allow_any_instance_of(PostsController).to receive(:gets).and_return("First post!","second post :/","2","Updated second post")
            expect(subject.create)
            expect(subject.create)
            expect(subject.update)
            expect{subject.index}.to output("1. First post!\n2. Updated second post\n").to_stdout

        end

        it '#destroy' do
            allow_any_instance_of(PostsController).to receive(:gets).and_return("First post!","Second post","2")
            expect(subject.create)
            expect(subject.create)
            expect(subject.destroy)
            expect{subject.index}.to output("1. First post!\n").to_stdout
        end

    end
    
    context "Comments" do
        subject{CommentController.new}

        it '#create' do

            allow_any_instance_of(CommentController).to receive(:gets).and_return("First comment")
            expect{subject.create}.to output("Write the comment: \n1. First comment\n").to_stdout

        end

        it '#show'do
            allow_any_instance_of(CommentController).to receive(:gets).and_return("First comment!","1")
            expect(subject.create)
            expect{subject.show}.to output("Write the index of the comment: \n1. First comment!\n").to_stdout
        end

        it '#index' do

            allow_any_instance_of(CommentController).to receive(:gets).and_return("First comment!","Second comment")
            expect(subject.create)
            expect(subject.create)
            expect{subject.index}.to output("1. First comment!\n2. Second comment\n").to_stdout

        end

        it '#update' do

            allow_any_instance_of(CommentController).to receive(:gets).and_return("First comment!","second comment","2","Updated second comment")
            expect(subject.create)
            expect(subject.create)
            expect(subject.update)
            expect{subject.index}.to output("1. First comment!\n2. Updated second comment\n").to_stdout

        end

        it '#destroy' do

            allow_any_instance_of(CommentController).to receive(:gets).and_return("First comment!","Second comment","2")
            expect(subject.create)
            expect(subject.create)
            expect(subject.destroy)
            expect{subject.index}.to output("1. First comment!\n").to_stdout

        end

    end

end