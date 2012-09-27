require 'integration/spec_helper'

describe Ashikawa::AR::Search do
  before(:all) {
    require 'examples/person.rb'

    Ashikawa::AR.setup :default, ARANGO_HOST
    database = Ashikawa::Core::Database.new ARANGO_HOST
    @collection = database["people"]
    @collection.truncate!
  }

  subject { Person.new name: "Sam Lowry", age: 38 }

  [:save, :save!].each do |method|
    it "should save a document" do
      expect do
        subject.send method
      end.to change { @collection.length }.by 1
    end

    it "should not create a new document if it is already saved" do
      subject.send method

      expect do
        subject.send method
      end.to change { @collection.length }.by 0
    end

    it "should update a document with new content" do
      subject.send method

      id = subject.id

      subject.name = "Jonathan Pryce"
      subject.send method

      @collection[id]["name"].should == "Jonathan Pryce"
    end
  end

  it "should not save an invalid document when using save" do
    subject.age = "invalid"

    expect do
      subject.save
    end.to change { @collection.length }.by 0
  end

  it "should throw an exception when saving an invalid document using save!" do
    subject.age = "invalid"

    expect { subject.save! }.to raise_error Ashikawa::AR::InvalidRecord
  end
end