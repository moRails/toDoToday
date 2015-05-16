Shoes.app do
  
  @mArray = Array.new
  load_previous_tasks = false
  
  File.open("todo.txt").readlines.each do |line|
    @mArray << line.to_s.gsub("\n", "")
  end

    stack :margin =>20, :width =>350 do
      flow do
        button "load" do
            @notes.clear
            load_previous_tasks = true
            alert @mArray.to_s
            @mArray.map {|data| @notes.append do para data, " ", link("delete"){|x| x.parent.remove} end}
        end
        button "save" do
            # save all the tasks in the todo.txt file
        end
      end
      title "MoDo  "

      flow do
        @add = edit_line
        button "add" do
          @mArray.push (@add.text.to_s)
          if load_previous_tasks
            @notes.clear
            @mArray.map {|data| @notes.append do para data, " ", link("delete"){|x| x.parent.remove} end}
          else
            @notes.append do
                para @add.text, " ",
                link("delete"){|x| x.parent.remove}
            end
          end
            @add.text = ""
        end
      end
    end
    @notes = stack :margin=>20, :width =>250 
end


