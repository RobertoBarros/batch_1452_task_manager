require_relative 'tasks_view'

class TasksController

  def initialize(repository)
    @repository = repository
    @view = TasksView.new
  end

  def list
    # Pegar todas as tasks
    tasks = @repository.all

    # Mostrar as tasks
    @view.display(tasks)
  end

  def add
    # Perguntar a descrição da Task
    description = @view.ask_description

    # Criar a intância de task
    task = Task.new(description)

    # Adicionar a task ao repository
    @repository.create(task)
  end

  def remove
    # Mostrar as tasks
    list

    # Perguntar o número da task a ser removido
    index = @view.ask_index

    # Mandar o repository destruir a task
    @repository.destroy(index)

  end

  def mark_as_done
    # Mostrar as tasks
    list

    # Perguntar a task a ser marcada
    index = @view.ask_index

    # recuperar a task do repository
    task = @repository.find(index)

    # Marcar a task como feita
    task.done!

    # Salvar no CSV
    @repository.save_csv

  end

end
