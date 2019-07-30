require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def log_in
    # ask for username
    username = @sessions_view.ask_for("username")
    # ask for password
    password = @sessions_view.ask_for("password")
    # check the credential
    employee = @employee_repository.find_by_username(username)
    credential_valid = employee&.password == password
    credential_valid ? employee : nil
  end
end
