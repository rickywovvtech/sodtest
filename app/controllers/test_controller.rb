class TestController < ApplicationController
    skip_before_action :verify_authenticity_token
     
    def tes
        nn= "testing"
        respond_to do |format|
        format.json {render :json=> {data: nn}, status: :ok}
        end
    end


    def  SolveSudoku(grid[N][N])
            if (!FindUnassignedLocation(grid, row, col))
            (1..9).each do |num|
                if (isSafe(grid, row, col, num)) 
                    grid[row][col] = num
                    if (SolveSudoku(grid))
                        return true
                    end
                    grid[row][col] = UNASSIGNED
                end
            return false;
        end

        def FindUnassignedLocation( grid[N][N],row,col)
            (0..N).each do |row|
                (0..N).each do |col|
                    if (grid[row][col] == UNASSIGNED)
                        return true
                    end
                end
            end
            return false
        end

    def UsedInRow(grid[N][N],row,num)
        (0..N).each do |col|
        if (grid[row][col] == num)
            return true
        end
        end
       return false
   end

   def UsedInCol( grid[N][N],col,num)
    (0..N).each do |row|
        if (grid[row][col] == num)
            return true
        end
      end
     return false
    end

    def UsedInBox(grid[N][N],boxStartRow,boxStartCol,num)
    (0..2).each do |row|
        (0..2).each do |col|
            if (grid[row + boxStartRow]
                  [col + boxStartCol] == num)
                return true
            end
        end
    end
    return false;
   end

   def isSafe(grid[N][N],row,col,num)
    return !UsedInRow(grid, row, num)
           && !UsedInCol(grid, col, num)
           && !UsedInBox(grid, row - row % 3,
                         col - col % 3, num)
           && grid[row][col] == UNASSIGNED
   end

   def printGrid(grid[N][N])
    (0..N).each do |row|
        (0..N).each do |col|
            render json:{data: grid[row][col]}
        end
    end
   end

def main

    UNASSIGNED= 0
    N= 9
    FindUnassignedLocation( grid[N][N], row, col)

    isSafe( grid[N][N], row, col,num)
        grid[N][N] =  [ [3, 0, 6, 5, 0, 8, 4, 0, 0 ],
                        [5, 2, 0, 0, 0, 0, 0, 0, 0 ],
                        [0, 8, 7, 0, 0, 0, 0, 3, 1 ], 
                        [0, 0, 3, 0, 1, 0, 0, 8, 0 ],
                        [9, 0, 0, 8, 6, 3, 0, 0, 5 ],
                        [0, 5, 0, 0, 9, 0, 6, 0, 0 ],
                        [1, 3, 0, 0, 0, 0, 2, 5, 0 ],
                        [0, 0, 0, 0, 0, 0, 0, 7, 4 ],
                        [0, 0, 5, 2, 0, 6, 3, 0, 0 ]]
    if (SolveSudoku(grid) == true)
        printGrid(grid)
    else
        render json:{data: "No solution exists"}
    end
end
      
end