import Pkg
using Plots

rowVec = [1 2 3]

colVec = [1;2;3]

sumVec = rowVec+colVec' # transposing colVec

x = range(1,1000,2000)
avg_vec = sumVec *.5 # average of two scalar vectors
plot(x*avg_vec)

import LinearAlgebra
LinearAlgebra.norm(sumVec)

for i in 1:3
    print("v unit[$i]= ")
    println(1/LinearAlgebra.norm(sumVec)*sumVec[i])
end

v1 = [1 2 3 4] 
v2 = [ 5 6 7 8]
product = LinearAlgebra.dot(v1,v2)
println("$v1 . $v2 = $product")

v3 = [ 0 -1 -2 -3]
res1 = LinearAlgebra.dot(v1,v2+v3)
res2 = LinearAlgebra.dot(v1,v2)+LinearAlgebra.dot(v1,v3)
res1 == res2

for i in 1:3
    hmresult = v1'[i] * v2[i]
    println("$(v1'[i]) ⊙ $(v2[i]) = $hmresult")
end

result = v1 * v1' 
println("$v1 x $(v1') = $result")
result

vc = [1;0;0]
vc2 = [0;0;1]
LinearAlgebra.cross(vc,vc2)

β = LinearAlgebra.dot(v1',v2) / LinearAlgebra.dot(v1',v1)
println("β = $β")

parallelcomponent = v1 * (LinearAlgebra.dot(v2',v1) / LinearAlgebra.dot(v1,v1'))
perpendicular = v2 - parallelcomponent

println("t⟂r = $perpendicular")
plot(v2.*x,line = (:steppre, :dot,:arrow, 0.5, 1, :grey),xlabel = "x",label=["v⃗1 [1] " "v⃗1 [2] " "v⃗1 [3]" "v⃗1 [4]"],font=(12,) )
plot!(parallelcomponent.*x,line = (:steppre,:dot, :arrow, 0.5, 1, :green),xlabel = "x",label=["parallelcomponent⃗ [1]" "parallelcomponent⃗ [2]" "parallelcomponent⃗ [3]" "parallelcomponent⃗ [4]"])
plot!(perpendicular.*x,line = (:steppre, :dot, :arrow, 0.5, 1, :blue),xlabel = "x",label=["perpendicular⃗ [1] " "perpendicular⃗ [2] " "perpendicular⃗ [3]" "perpendicular⃗ [4]"])


V = ([1;3],[2,7])

S = ([1;3],[2;6])
λ = 2
S[1].* λ ==  S[2]
println("λv1 = v2")

import  Statistics
v1_mean = Statistics.mean(v1)
v1_meancentered = map(x->x-v1_mean,v1)
v2_mean = Statistics.mean(v2)
v2_meancentered = map(x->x-v2_mean,v2)
ρ = LinearAlgebra.dot(v1_meancentered',v2_meancentered) / LinearAlgebra.dot(LinearAlgebra.norm(v1_meancentered),LinearAlgebra.norm(v2_meancentered))
println("Pearson correlation coefficient = $ρ")

α = LinearAlgebra.dot(v1,v2)/ LinearAlgebra.dot(LinearAlgebra.norm(v1),LinearAlgebra.norm(v2))
println("Cosine Similarity = $α")

a1 = [0 10]
b1 = [9 3]
distance = sqrt((a1[1]-b1[1])^2 +(a1[2]-b1[2])^2 )
println("Distance between the two 1x2 vectors is $distance")


