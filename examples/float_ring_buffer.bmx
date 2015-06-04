SuperStrict

Type TFloatRingBuffer
	Field capacity:Int
	Field size:Int
	Field count:Long
	Field elements:Float[]
	Field nextIdx:Int = 0
	
	Function Create:TFloatRingBuffer(capacity:Int)
		If capacity <= 0 Then Throw "capacity " + capacity + " <= 0"
		Local ringBuffer:TFloatRingBuffer = New TFloatRingBuffer
		ringBuffer.capacity = capacity
		ringBuffer.elements = New Float[capacity]
		Return ringBuffer
	End Function
	
	Method put(e:Float)
		elements[nextIdx] = e
		nextIdx = (nextIdx + 1) Mod capacity
		If size < capacity Then size :+ 1
		count :+ 1
	End Method
	
	Method peak(start:Long, buffer:Float Ptr, offset:Int, length:Int)
		If length = 0 Then
			Return
		ElseIf start >= count Then
			Throw "try To read at " + start + ", but count is " + count
		ElseIf start < count - size Then
			Throw "try to read at " + start + ", but oldest available is at " + (count - size)
		Else If start + length > count Then
			Throw "try to read " + length + " at " + start + ", but count is " + count
		EndIf

		Local startIdx:Int = (nextIdx - (count - start)) Mod capacity;
		If startIdx < 0 Then startIdx :+ capacity;
		For Local i:Int = 0 Until length
			Local j:Int = (startIdx + i) Mod capacity;
			Local element:Float = elements[j]
			buffer[i + offset] = element
		Next
	End Method
	
	Method peakLast(buffer:Float Ptr, offset:Int, length:Int)
		Local start:Long = count - length
		peak(start, buffer, offset, length)
	End Method
	
	Method peakLastElement:Float()
		If size = 0 Then Throw "size is 0"
		
		Local index:Int = (nextIdx - 1) Mod capacity
		If index < 0 Then index :+ capacity
		Return elements[index]		
	End Method
	
	Method get:Float(start:Long)
		If start >= count Then
			Throw "try to read at " + start + ", but count is " + count
		Else If (start < count - size) Then
			Throw "try to read at " + start + ", but oldest available is at " + (count - size)
		EndIf

		Local startIdx:Int = (nextIdx - (count - start)) Mod capacity;
		If startIdx < 0 Then startIdx :+ capacity;
		Return elements[startIdx]
	End Method
	
	Method getCapacity:Int()
		Return capacity
	End Method
	
	Method getSize:Int()
		Return size
	End Method
	
	Method isEmpty:Int()
		Return getSize() = 0
	End Method
	
	Method getCount:Long()
		Return count
	End Method
	
	Method clear()
		nextIdx = 0
		size = 0
		count = 0
	End Method
End Type
