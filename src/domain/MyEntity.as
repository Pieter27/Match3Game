package domain 
{
	/**
	 * ...
	 * @author Pieter Verhoeven
	 */
	import net.flashpunk.Entity
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	
	public class MyEntity extends Entity
	{
		[Embed(source="../../images/test.png")] private const TEST:Class;

		public function MyEntity() 
		{
			graphic = new Image(TEST);
			Input.define("Jump", Key.Z, Key.UP);
			Input.define("Shoot", Key.ESCAPE, Key.X, Key.C);
		}
		
		override public function update():void {
			// Assigns the Entity's position to that of the mouse (relative to the Camera).
			x = Input.mouseX;
			y = Input.mouseY;
			// Assigns the Entity's position to that of the mouse (relative to the World).
			//x = FP.world.mouseX;
			//y = FP.world.mouseY;
			
		}
	}

}