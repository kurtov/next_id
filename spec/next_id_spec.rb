require "spec_helper"

RSpec.describe NextId do
  it "has a version number" do
    expect(NextId::VERSION).not_to be nil
  end

  context "when connect to database" do
    before (:all) do
      NextId::Database.delete
      NextId::Database.create
      NextId::Database.setup
    end

    context "owner is specified" do
      it "AR\#next_id works as expected" do
        expect(SimplePrimaryKeyWithOwner.next_id).to_not be_nil
        expect{CompositePrimaryKey.next_id}.to raise_error(RuntimeError)
      end

      it "AR::create works as expected" do
        expect(SimplePrimaryKeyWithOwner.create(name: "model2").id).to_not be_nil
      end
    end

    unless NEED_SPECIFY_OWNER
      context "owner is not specified" do
        it "AR\#next_id works as expected" do
          expect(SimplePrimaryKey.next_id).to_not be_nil
        end

        it "AR::create works as expected" do
          expect(SimplePrimaryKey.create(name: "model1").id).to_not be_nil
        end
      end
    end
  end
end
