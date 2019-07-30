require 'csv'



class BaseRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @elements = []
    @next_id  = 1
    load_csv if File.exist?(csv_path)
  end

  def all
    @elements
  end

  def add(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  private

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, options) do |attributes|
      @elements << @element_class.new(attributes)
    end
    @next_id = @elements.last.id + 1
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv_file|
      csv_file << @element_class.headers
      @elements.each do |element|
        csv_file << element.to_a
      end
    end
  end
end
