/obj/structure/hispasign
	icon = 'icons/obj/hispasigns.dmi'
	anchored = 1
	opacity = 0
	density = 0
	layer = SIGN_LAYER
	obj_integrity = 100
	max_integrity = 100
	armor = list(melee = 50, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 50, acid = 50)
	var/buildable_sign = 1 //unwrenchable and modifiable



/obj/structure/hispasign/play_attack_sound(damage_amount, damage_type = BRUTE, damage_flag = 0)
	switch(damage_type)
		if(BRUTE)
			if(damage_amount)
				playsound(src.loc, 'sound/weapons/slash.ogg', 80, 1)
			else
				playsound(loc, 'sound/weapons/tap.ogg', 50, 1)
		if(BURN)
			playsound(loc, 'sound/items/welder.ogg', 80, 1)

/obj/item/sign_backing
	name = "sign backing"
	desc = "A sign with adhesive backing."
	icon = 'icons/obj/hispasigns.dmi'
	icon_state = "backing"
	w_class = 3
	resistance_flags = FLAMMABLE

/obj/item/sign_backing/afterattack(atom/target, mob/user, proximity)
	if(isturf(target) && proximity)
		var/turf/T = target
		user.visible_message("<span class='notice'>[user] fastens [src] to [T].</span>", \
							 "<span class='notice'>You attach a blank sign to [T].</span>")
		playsound(T, 'sound/items/Deconstruct.ogg', 50, 1)
		new sign_path(T)
		user.drop_item()
		qdel(src)
	else
		return ..()

/obj/structure/hispasign/nohulk
	name = "No hulk: Its ilegal"
	desc = "No hulk: Its ilegal"
	icon_state = "nohulk"
