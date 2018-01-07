module BinaryTree
    class BosDugum

        def to_a
            []
        end 

        def include?(*)
            false
        end

        def ekle(*)
            false
        end 

        alias_method :<<, :ekle

        def incele
        
        end 
    end

    class Node
        attr_reader :dugum
        attr_accessor :sol, :sag

        def initialize(v)
            @dugum = v
            @sol = BosDugum.new
            @sag = BosDugum.new
        end

        def ekle(v)
            case dugum <=> v
            when 1 then ekle_sol(v)
            when -1 then ekle_sag(v)
            when 0 then false
            end 
        end 

        alias_method :<<, :ekle

        def include?(v)
            case dugum <=> v 
            when 1 then sol.include?(v)
            when -1 then sag.include?(v)
            when 0 then true
            end 
        end 

        def incele
          "#{dugum} #{sol.incele} #{sag.incele}"
        end 

        def to_a
            sol.to_a + [dugum] + sag.to_a
        end

        private

        def ekle_sol(v)
            sol.ekle(v) || self.sol = Node.new(v)
        end

        def ekle_sag(v)
            sag.ekle(v) || self.sag = Node.new(v)
        end
    end 
end 

tree = BinaryTree::Node.new(10)
#tree.sol = BinaryTree::Node.new(5)
#tree.sag = BinaryTree::Node.new(15)

tree.ekle(5)
tree.ekle(15)
tree.ekle(3)
tree.ekle(12)
tree.ekle(8)
tree.ekle(17)

puts tree.incele