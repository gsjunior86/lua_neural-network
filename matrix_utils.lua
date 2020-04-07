local matrix = require "lib.matrix"


function m_dot(m,n)

  for i=1, #m do
    for j=1, #m[i] do
        m[i][j] = m[i][j] * n
    end
  end

return m
end

function m_func(m,n)
  x = {}
  for i=1, #m do
  x[i] = {}
    for j=1, #m[i] do
        x[i][j] = n(m[i][j])
    end
  end

return matrix(x)
end

function print_matrix(m)
  l = ""
  for i=1, #m do
    for j=1, #m[i] do
        l = l .. m[i][j] .. " "
    end
    l = l .. "\n"
  end
print(string.format("%1.0f",l))
end

