#tag Class
Protected Class LongTests_JSONItem_MTC
Inherits TestGroup
	#tag Method, Flags = &h21
		Private Sub UnicodeTest()
		  dim j as JSONItem_MTC
		  
		  for i as integer = 0 to &hFFFF
		    if i >= 8 and i <= 13 then
		      continue for i
		    end if
		    if i > 31 and i < 127 then
		      continue for i
		    end if
		    if i >= &hD800 and i <= &hDFFF then
		      continue for i
		    end if
		    
		    dim char as string = Encodings.UTF8.Chr( i )
		    dim encoded as string = "[""\u" + Right( "0000" + Hex( i ), 4 ) + """]"
		    
		    j = new JSONItem_MTC( encoded )
		    j.EncodeUnicode = JSONItem_MTC.EncodeType.All
		    Assert.AreSame( EncodeHex( char ), EncodeHex( j( 0 ) ), encoded )
		    Assert.AreSame( encoded, j.ToString, str( i ) )
		  next i
		  
		  for i as integer = &h10000 to &h10FFFF
		    dim char as string = Encodings.UTF8.Chr( i )
		    dim char16 as string = char.ConvertEncoding( Encodings.UTF16BE )
		    dim encoded as string = "[""\u" + Right( "0000" + EncodeHex( char16.LeftB( 2 ) ), 4 ) + "\u" + Right( "0000" + EncodeHex( char16.RightB( 2 ) ), 4 ) + """]"
		    
		    j = new JSONItem_MTC( encoded )
		    j.EncodeUnicode = JSONItem_MTC.EncodeType.All
		    Assert.AreSame( EncodeHex( char ), EncodeHex( j( 0 ) ), encoded )
		    Assert.AreSame( encoded, j.ToString, str( i ) )
		  next i
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="FailedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeGroup"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass