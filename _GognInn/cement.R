
require(tibble)

concrete.mixes <- tribble(
  ~concrete.type, ~cement.kg, ~sand.kg, ~aggregate.kg, ~water.kg,
  #---#-
  '3000psi', 234, 707, 725, 132,
  '3500psi', 326, 961, 867, 150 ,
  '4000psi', 368, 1081, 737, 160,
  '4500psi', 1, 2.26, 1.73, 0.5
)

sand.and.stone <- 
  tribble(
    ~material, ~m.class, ~density, ~size.mm, ~sieve,
    # -------, --------, ---------
    'aggregate.light', 'aggregate',  1520, 4.75, 4, 
    'aggregate.heavy', 'aggregate',  1680, 4.75, 200,
    'aggregate',       'aggregate',  1600, 5, 10,
    'heavy.weight',    'aggregate',  2080, NA, NA,
    'basalt',          'rock',       2800, NA, NA,
    'flint',           'rock',       2540, NA, NA,
    'granite',         'rock',       2690, NA, NA,
    'gritstone',       'rock',       2690, NA, NA,
    'hornfels',        'rock',       2820, NA, NA,
    'limestone',       'rock',       2660, NA, NA,
    'porphyry',        'rock',       2730, NA, NA,
    'quartzite' ,      'rock',       2620, NA, NA,
    'aragonite',       'rock',       2900, NA, NA,
    'sandstone',       'aggregate',  2200, NA, NA,
    'concrete',        'aggregate',  2243, NA, NA
  )


aggregate.classes <- 
  tribble(
    ~aggregate.class, ~a.cl,~descr,
    #---------------, -----,--------
    'coarse.aggregate', 'CA', '4.75 mm or larger',
    'fine.aggregate',   'FA', 'less than 4.75 mm'
  )


conversion.factors <- 
  tribble(
    ~unit.cd, ~unit.in, ~unit.out, ~muliplier,
    #-------, --------, ----------, ----------
    'M3_L',   'L',      'M3',       0.001,
    'G_KG',   'KG',      'G',       1000,
    'L_GAL',  'GAL',     'L',       3.79,
    'GAL_L',  'L',       'GAL',     0.2642,
    'KG_LB',  'LB',      'KG',      2.21,
    'LB_KG',  'KG',      'LB',      0.454,
    'IN_CM',  'CM',      'IN',      2.54,
    'CM_IN',  'IN',      'CM',      0.39,
    'QT_L',   'L',       'QT',      1/1.057,
    'PT_L',   'L',       'PT',      1/2.113,
    'GILL_L',  'L',      'GILL',    1/8.454,
    'FLOZ_L',  'L',      'FLOZ',    1/33.81
    )
