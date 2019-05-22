require "rails_helper"

RSpec.describe Student, type: :model do
  it 'has attributes' do
    attributes = {"id" => 4, "name" => "Snape"}
    student = Student.new(attributes)

    expect(student.id).to eq(4)
    expect(student.name).to eq("Snape")
  end
end
