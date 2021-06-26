
Class constructor
	This:C1470.label:="Select object"
	
Function onInvoke($editor : Object)->$result : Object
	
	If ($editor.editor.currentPage.objects#Null:C1517)
		var $menu; $groupmenu : Object
		$menu:=cs:C1710.menu.new()
		
		var $groupName; $objectName : Text
		
		If ($editor.editor.form.editor.groups#Null:C1517)  // & and length > 0 (but ...)
			
			var $coladded : Collection
			$coladded:=New collection:C1472
			// first by group
			For each ($groupName; $editor.editor.form.editor.groups)
				$groupmenu:=cs:C1710.menu.new()
				
				For each ($objectName; $editor.editor.form.editor.groups[$groupName])
					If ($editor.editor.currentPage.objects[$objectName]#Null:C1517)
						$groupmenu.append($objectName; $objectName)
						$coladded.push($objectName)
					End if 
				End for each 
				
				$menu.append($groupName; $groupmenu)
				
			End for each 
			
			// not in grop
			For each ($objectName; $editor.editor.currentPage.objects)
				If ($coladded.indexOf($objectName)<0)
					$menu.append($objectName; $objectName)
				End if 
			End for each 
			
		Else 
			// add all
			For each ($objectName; $editor.editor.currentPage.objects)
				$menu.append($objectName; $objectName)
			End for each 
		End if 
	End if 
	
	$menu.popup()
	
	If ($menu.selected)
		
		$editor.editor.currentSelection:=New collection:C1472($menu.choice)
		
		$result:=New object:C1471("currentSelection"; $editor.editor.currentSelection; \
			"currentPage"; $editor.editor.currentPage)
		
	End if 