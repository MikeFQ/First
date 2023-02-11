

CREATE PROCEDURE Fibonacci (@max INT)
AS
BEGIN
	DECLARE @numbers TABLE (numbers INT)
	DECLARE @num1 INT = 0, @num2 INT = 1, @inc INT = 0, @temp INT
	INSERT INTO @numbers VALUES (@num1), (@num2)
	WHILE (@inc < @max - 2)
	BEGIN
		INSERT INTO @numbers VALUES (@num2 + @num1)
		SET @temp = @num2
		SET @num2 = @num2 + @num1
		SET @num1 = @temp
		SET @inc += 1
	END
	SELECT * FROM @numbers
END
GO

EXEC Fibonacci 10
GO
			