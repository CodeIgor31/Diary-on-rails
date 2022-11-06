class NotesController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "qweqwe", 
    except: [:index, :show]
    def index
        @note = Note.all
    end

    def new
        @note = Note.new
    end

    def show
        @note = Note.find(params[:id])
    end

    def edit
        @note = Note.find(params[:id])
    end

    def update
        @note = Note.find(params[:id])
        if @note.update(note_params)
            redirect_to @note
        else
            render 'edit'
        end
    end

    def destroy
        @note = Note.find(params[:id])
        @note.destroy
        redirect_to notes_path
    end

    def create
        @note = Note.new(note_params)
        
        if @note.save
            redirect_to @note
        else
            render 'new'
        end
    end

    private def note_params
        params.require(:note).permit(:title, :body)
    end
end
