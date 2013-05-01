data CellState = Dead | Alive
data Position = Position Integer Integer
type Generation = Position -> CellState

evolution :: Generation -> Generation
evolution generation = new_generation generation

alive_neighbors :: Generation -> Position -> Int
alive_neighbors generation position = length (filter is_alive (map generation (neighbors position)))

is_alive :: CellState -> Bool
is_alive Alive = True
is_alive Dead = False

neighbors :: Position -> [Position]
neighbors (Position x y) = 
    [(Position (x-1) (y-1)), (Position x (y-1)),  (Position (x+1) (y-1)), (Position (x+1) y),
     (Position (x+1) (y+1)), (Position x (y+1)), (Position (x-1) (y+1)), (Position (x-1) y)]

new_generation :: Generation -> Position -> CellState
new_generation generation position = 
    case (alive_neighbors generation position) of
        2 -> if (is_alive (generation position)) then Alive else Dead
        3 -> Alive
        _ -> Dead

print_generation generation = 
    map (line generation) [1..10]

line generation y =
    concat (map (visualize_cell generation y) [1..10])

visualize_cell generation y x = 
    case (generation (Position x y)) of
        Alive -> ['X']
        Dead -> [' ']
    
bar (Position 1 2) = Alive
bar (Position 2 2) = Alive
bar (Position 3 2) = Alive
bar (Position x y) = Dead
