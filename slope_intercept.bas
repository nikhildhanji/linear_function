
CLS
CONST scale_factor = 10
CONST dx = 0.000001
DIM m AS DOUBLE
DIM c AS DOUBLE
DIM l AS DOUBLE
DIM h AS DOUBLE
DIM a AS STRING
DIM SHARED area AS DOUBLE
COLOR 28, 0:  print "/ + - = * = - + /"
PRINT "THE FORM y = mx + c IS THE SLOPE-INTERCEPT FORM."
PRINT "WHERE m IS THE SLOPE AND c IS THE y-INTERCEPT."
PRINT
INPUT "ENTER THE SLOPE  ", m
INPUT "ENTER THE y-INTERCEPT  ", c
INPUT "ENTER THE LOWER LIMIT OF X  ", l
DO
    INPUT "ENTER THE HIGHER LIMIT OF X  ", h
LOOP WHILE h <= l
INPUT "DO YOU WISH TO CALCULATE THE AREA ?  ", a
SCREEN 12
DRAW_AXES
ON ERROR GOTO handler
PLOT l, h, m, c, UCASE$(a)
handler:
IF ERR > 0 THEN
    RESUME NEXT
END IF

PRINT "f(x)="; m; "x + ("; c; ") "
PRINT "AREA = "; area
END

SUB DRAW_AXES
    DIM X AS INTEGER
    DIM Y AS INTEGER
    FOR X = 0 TO 640 STEP scale_factor
        IF X = 320 THEN
            LINE (X, 0)-(X, 480), 14
        ELSE
            LINE (X, 0)-(X, 480), 8
        END IF
    NEXT X
    FOR Y = 0 TO 480 STEP scale_factor
        IF Y = 240 THEN
            LINE (0, Y)-(640, Y), 14
        ELSE
            LINE (0, Y)-(640, Y), 8
        END IF
    NEXT Y
END SUB



SUB PLOT (l AS DOUBLE, h AS DOUBLE, m AS DOUBLE, c AS DOUBLE, a AS STRING)
    DIM x AS DOUBLE
    DIM y AS DOUBLE
    area = 0

    FOR x = l TO h STEP dx
        y = m * x + c
        PSET (x * scale_factor + 320, (y) * -scale_factor + 240), 10
        IF a = "Y" THEN
            area = area + (ABS(y) * dx)
            LINE (x * scale_factor + 320, 240)-(x * scale_factor + 320, (y) * -scale_factor + 240), 3
        END IF

    NEXT x

END SUB
