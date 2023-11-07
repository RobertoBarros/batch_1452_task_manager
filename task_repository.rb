require 'csv'

class TaskRepository

  def initialize(csv_filename)
    @csv_filename = csv_filename
    @tasks = []
    @tasks = load_csv if File.exist?(@csv_filename)
  end

  def create(task)
    @tasks << task
    save_csv
  end

  def all
    @tasks
  end

  def find(index)
    @tasks[index]
  end

  def destroy(index)
    @tasks.delete_at(index)
    save_csv
  end

  def load_csv
    tasks = []
    CSV.foreach(@csv_filename) do |row|
      description = row[0]
      done = row[1] == 'true'
      task = Task.new(description)
      task.done! if done
      tasks << task
    end
    tasks
  end

  def save_csv
    CSV.open(@csv_filename, 'wb') do |csv|
      @tasks.each do |task|
        csv << [task.description, task.done?]
      end
    end
  end

end
