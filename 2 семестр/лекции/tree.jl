function trace(tree::Vector)
    if isempty(tree)
        return
    end
        
    println(tree[end]) # "обработка" корня
    
    for subtree in tree[1:end-1]
        trace(subtree)
    end
end

#--------------------------------------------------------------
function convert!(intree::Vector, outtree::Dict{Int,Vector})
    #println(outtree)
    if isempty(intree)
        return
    end
    list = []
    for subtree in intree[1:end-1]
        if isempty(subtree)
            push!(list, nothing)
            continue
        end 
        push!(list, subtree[end])
        convert!(subtree,outtree)
    end
    outtree[intree[end]]=list
    return outtree
end

#--------------------------------------

struct Node
    index::Int
    childs::Vector      
end

function convert(intree::Dict{Int,Vector}, root::Union{Int,Nothing})::Union{Node,Nothing}
    if isnothing(root)
        return nothing
    end
    node = Node(root, [])
    for sub_root in intree[root]
        push!(node.childs, convert(intree, sub_root))
    end
    return node
end
#-------------------------- TEST


tree=Dict{Int, Vector}()

intree=[[[[],[],6], [], 2], [[[],[],4], [[],[],5], 3],1]
convert!(intree,tree)