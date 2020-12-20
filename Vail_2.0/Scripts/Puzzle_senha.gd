extends Node2D

var possiveis_senhas = [34,32,30,26,24,22]
var senha
var sequencia = 0
var pilar = 1
func _ready():
	randomize()
	var i = randi() % 6
	senha = possiveis_senhas[i]
	print(senha)
	pass

func _process(delta):
	if sequencia == senha : 
		print('acertou')
	if pilar == 4 and sequencia != senha:
		$Pilar.get_node("Pilar_Area_1").disabled = false
		$Pilar2.get_node("Pilar_Area_2").disabled = false
		$Pilar3.get_node("Pilar_Area_3").disabled = false
		print("sequecia : ",sequencia)
		sequencia = 0
		pilar = 1
		print('errou')
		
	


func _on_Pilar_area_entered(area):
	if not $Pilar.get_node("Pilar_Area_1").disabled :
		sequencia += pilar * 2
		pilar +=1
		$Pilar.get_node("Pilar_Area_1").disabled = true
	pass 


func _on_Pilar2_area_entered(area):
	if not $Pilar2.get_node("Pilar_Area_2").disabled:
		sequencia += pilar * 4
		pilar+=1
		$Pilar2.get_node("Pilar_Area_2").disabled = true
	pass 


func _on_Pilar3_area_entered(area):
	if not  $Pilar3.get_node("Pilar_Area_3").disabled :
		sequencia += pilar * 8
		pilar+=1
		$Pilar3.get_node("Pilar_Area_3").disabled = true
	
	pass 
