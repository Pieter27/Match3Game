package domain 
{
	/**
	 * ...
	 * @author Pieter Verhoeven
	 */
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.tweens.misc.MultiVarTween;
	import net.flashpunk.utils.Input;
	import net.flashpunk.graphics.Image;

	public class Tile extends Entity
	{
		[Embed(source = "../../images/GemBlue.png")] private const BLUE: Class;
		[Embed(source = "../../images/GemGreen.png")] private const GREEN: Class;
		[Embed(source = "../../images/GemOrange.png")] private const ORANGE: Class;
		[Embed(source = "../../images/GemPink.png")] private const PINK: Class;
		[Embed(source = "../../images/GemPurple.png")] private const PURPLE: Class;
		[Embed(source = "../../images/GemRed.png")] private const RED: Class;
		
		[Embed(source = "../../images/GemBlueSelected.png")] private const BLUE_SELECTED: Class;
		[Embed(source = "../../images/GemGreenSelected.png")] private const GREEN_SELECTED: Class;
		[Embed(source = "../../images/GemOrangeSelected.png")] private const ORANGE_SELECTED: Class;
		[Embed(source = "../../images/GemPinkSelected.png")] private const PINK_SELECTED: Class;
		[Embed(source = "../../images/GemPurpleSelected.png")] private const PURPLE_SELECTED: Class;
		[Embed(source = "../../images/GemRedSelected.png")] private const RED_SELECTED: Class;
		
		
		
		private var _col : int;
		private var _row : int;
		private var clicked : Boolean  = false;
		private var mouseEnabled : Boolean = true;
		
		public function Tile() 
		{
			setRandomColor();
			setHitboxTo(graphic);
			type = "tile";
		}
		
		public function setRandomColor(): void{
			var colorClass : Class;
			var colorInt : int = Math.ceil(Math.random() * 6);
			switch (colorInt) {
				case 1: colorClass = BLUE; name = "blue"; break;
				case 2: colorClass = GREEN; name = "green"; break;
				case 3: colorClass = ORANGE; name = "orange";  break;
				case 4: colorClass = PINK; name = "pink"; break;
				case 5: colorClass = PURPLE; name = "purple"; break;
				case 6: colorClass = RED; name = "red"; break;
			}
			
			var img : Image = new Image(colorClass);
			graphic = img;
			width = img.width;
			height = img.height;
			

		}
		
		override public function update(): void {
			super.update();
			if(mouseEnabled){
				if (collidePoint(x, y, world.mouseX, world.mouseY)) {
					if (Input.mousePressed) 
						clicked = true;
					if (clicked && Input.mouseReleased)
						click();
				}
				if (Input.mouseReleased) 
					clicked = false;
			}
		}
		
		public function click() : void{
			var selectedTile : Tile = Tile(world.typeFirst("selected"));
			if (selectedTile == null) {
				selectTile();
				this.type = "selected";
			}
			else if (checkIfAdjecent(selectedTile)){
				switchTiles(selectedTile);
				selectedTile.unselectTile();
				selectedTile.type = "tile";
			}
			else {
				selectedTile.unselectTile();
				selectedTile.type = "tile";
			}
		}
		
		public function checkIfAdjecent(selectedTile: Tile): Boolean {
			var rowDifference : int = Math.abs(this.row - selectedTile.row);
			var colDifference : int = Math.abs(this.col - selectedTile.col);
			
			if ((rowDifference == 1 && colDifference == 0) || (rowDifference == 0 && colDifference == 1))
				return true;
			else
				return false;
		}
		
		public function switchTiles(selectedTile: Tile): void {
			disableMouse();
			selectedTile.disableMouse();
			
			var tempX : int = this.x;
			var tempY : int = this.y;
			
			var mvTween1 : MultiVarTween = new MultiVarTween(enableMouse);
			mvTween1.tween(this, { x: selectedTile.x, y : selectedTile.y }, 1);
			var mvTween2 : MultiVarTween = new MultiVarTween(selectedTile.enableMouse);
			mvTween2.tween(selectedTile, { x: tempX, y : tempY },1);
			
			addTween(mvTween1, true);
			addTween(mvTween2, true);
			
			var tempCol : int = this.col;
			var tempRow : int = this.row;
			
			this.row = selectedTile.row;
			this.col = selectedTile.col;
			selectedTile.row = tempRow;
			selectedTile.col = tempCol;
		}
		
		public function enableMouse() {
			trace('complete');
			mouseEnabled = true;
		}
		public function disableMouse(){
			mouseEnabled = false;
		}
		public function selectTile(): void {
			switch (name) {
				case "blue": graphic = new Image(BLUE_SELECTED); break;
				case "green": graphic = new Image(GREEN_SELECTED); break;
				case "orange": graphic = new Image(ORANGE_SELECTED); break;
				case "pink": graphic = new Image(PINK_SELECTED); break;
				case "purple": graphic = new Image(PURPLE_SELECTED); break;
				case "red": graphic = new Image(RED_SELECTED); break;
			}
		}
		
		public function unselectTile(): void{
			switch (name) {
				case "blue": graphic = new Image(BLUE); break;
				case "green": graphic = new Image(GREEN); break;
				case "orange": graphic = new Image(ORANGE); break;
				case "pink": graphic = new Image(PINK); break;
				case "purple": graphic = new Image(PURPLE); break;
				case "red": graphic = new Image(RED); break;
			}
		}
		
		public function get row():int 
		{
			return _row;
		}
		
		public function set row(value:int):void 
		{
			_row = value;
		}
		
		public function get col():int 
		{
			return _col;
		}
		
		public function set col(value:int):void 
		{
			_col = value;
		}
	}

}