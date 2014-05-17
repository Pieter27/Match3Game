package domain 
{
	/**
	 * ...
	 * @author Pieter Verhoeven
	 */
	import net.flashpunk.World;
	import domain.Player;
	
	public class MyWorld extends World
	{
		public function MyWorld() 
		{
			add(new GameBoard);
		}
		
	}


}