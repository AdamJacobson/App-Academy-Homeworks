require 'rspec'
require 'cache_node'

describe CacheNode do
  subject(:node) { CacheNode.new("first node") }
  let(:pr) { CacheNode.new("previous") }
  let(:nx) { CacheNode.new("next") }

  context "#new" do
    it "initializes with a value." do
      expect(node.value).to eq("first node")
    end

    it "next and prev nodes default to nil" do
      expect(node.prev).to eq(nil)
      expect(node.next).to eq(nil)
    end
  end

  context "#set_next" do
    it "sets the next node of the current node" do
      node.set_next(nx)
      expect(node.next).to eq(nx)
      expect(nx.prev).to eq(node)
    end
  end

  context "#set_prev" do
    it "sets the previous node of the current node" do
      node.set_prev(pr)
      expect(node.prev).to eq(pr)
      expect(pr.next).to eq(node)
    end
  end

  context "#insert_after" do
    it "inserts node between the specified nodes" do
      pr.set_next(nx)
      node.insert_after(pr)

      expect(node.prev).to eq(pr)
      expect(node.next).to eq(nx)

      expect(pr.next).to eq(node)
      expect(nx.prev).to eq(node)

      expect(pr.iterate).to eq(["previous", "first node", "next"])
    end
  end

  context "#delete" do
    it "removes the node from the linked list" do
      pr.set_next(nx)
      node.insert_after(pr)

      node.delete
      expect(pr.next).to eq(nx)
      expect(nx.prev).to eq(pr)
    end
  end

  context "#iterate" do
    let(:dummy1) { CacheNode.new("dummy 1") }
    let(:dummy2) { CacheNode.new("dummy 2") }
    it "prints values of nodes in order" do
      node.set_next(nx)
      nx.set_next(dummy1)
      dummy1.set_next(dummy2)

      expect(node.iterate).to eq(["first node", "next", "dummy 1", "dummy 2"])
    end
  end

end
