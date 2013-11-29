data Position = Position Integer Integer
type Generation = Position -> Bool

alive_neighbors :: Generation -> Position -> Int
alive_neighbors generation position = length (filter is_alive (map generation (neighbors position)))

is_alive :: Bool -> Bool
is_alive True = True
is_alive False = False

neighbors :: Position -> [Position]
neighbors (Position x y) = 
    [(Position (x-1) (y-1)), (Position x (y-1)),  (Position (x+1) (y-1)), (Position (x+1) y),
     (Position (x+1) (y+1)), (Position x (y+1)), (Position (x-1) (y+1)), (Position (x-1) y)]

evolution :: Generation -> Generation
evolution generation position = 
    evolution_pm (alive_neighbors generation position) (is_alive (generation position))

evolution_pm :: Int -> Bool -> Bool
evolution_pm 2 alive = alive
evolution_pm 3 _ = True
evolution_pm _ _ = False

visualize_generation generation = 
    map (visualize_line generation) [1..10]

visualize_line :: Generation -> Integer -> String
visualize_line generation y =
    concat (map (visualize_cell generation y) [1..10])

visualize_cell generation y x = 
    case (generation (Position x y)) of
        True -> ['X']
        False -> [' ']

visualize_cell_pm True = ['X']
visualize_cell_pm False = [' ']
    
bar (Position 1 2) = True
bar (Position 2 2) = True
bar (Position 3 2) = True
bar (Position x y) = False
