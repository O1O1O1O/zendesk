require 'problem'

describe Problem do
  let(:input) {
    []
  }
  let(:problem) { described_class.new }
  
  before do
    problem.ingest(input)
  end
    
  describe "#roots" do
    subject {
      problem.roots
    }
    
    context "when there is one tuple" do
      let(:input) { [[100, 200]] }
      
      it "returns just that item as a root" do
        expect(subject).to eq([100])
      end
    end

    context "where there are two disjoint tuples" do
      let(:input) { [[100, 200], [300,400]] }

      it "returns two roots" do
        expect(subject).to eq([100, 300])
      end
    end

    context "when there are three tuples connected belatedly" do
      let(:input) { [[100,200], [300,400], [200, 300]] }

      it "returns one root" do
        expect(subject).to eq([100])
      end
    end
  end

    describe "#leaves" do
    subject {
      problem.leaves
    }
    
    context "when there is one tuple" do
      let(:input) { [[100, 200]] }
      
      it "returns just that item as a leaf" do
        expect(subject).to eq([200])
      end
    end

    context "where there are two disjoint tuples" do
      let(:input) { [[100, 200], [300,400]] }

      it "returns two leaves" do
        expect(subject).to eq([200, 400])
      end
    end

    context "when there are three tuples connected belatedly" do
      let(:input) { [[100,200], [300,400], [200, 300]] }

      it "returns one leaf" do
        expect(subject).to eq([400])
      end
    end
  end
end
